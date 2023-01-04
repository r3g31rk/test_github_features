<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:x="http://www.xmlplease.com" xmlns:saxon="http://saxon.sf.net/" xmlns:date="http://exslt.org/dates-and-times" xmlns:dyn="http://exslt.org/dynamic" xmlns:exsl="http://exslt.org/common" xmlns:func="http://exslt.org/functions" xmlns:math="http://exslt.org/math" xmlns:random="http://exslt.org/random" xmlns:regexp="http://www.exslt.org/regexp/functions/match/index.html" xmlns:set="http://exslt.org/sets" xmlns:str="http://exslt.org/strings" xmlns:dc="http://dublincore.org/documents/dcmi-namespace/" exclude-result-prefixes="x saxon date dyn exsl func math random regexp set str dc">
	<dc:creator>Jesper Tverskov</dc:creator>
	<dc:title>element-function-available.xsl</dc:title>
	<dc:URI>http://www.xmlplease.com/element-function-available.xsl</dc:URI>
	<dc:hasVersion>1.1</dc:hasVersion>
	<dc:modified>2008-10-23</dc:modified>
	<dc:created>2008-10-22</dc:created>
	<!-- see log of changes at end of document -->
	<xsl:output indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
	<!-- Param "date" is only relevant for XSLT 1.0 processor -->
	<xsl:param name="date" select="'?'"/>
	<xsl:variable name="date2">
		<xsl:choose>
			<xsl:when test="system-property('xsl:version') = '2.0'">
				<xsl:value-of select="format-date(current-date(), '[Y]-[M01]-[D01]')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$date"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="version">
		<xsl:choose>
			<xsl:when test="system-property('xsl:version') = '2.0'">2</xsl:when>
			<xsl:otherwise>1</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<!-- Param "name" is only relevant for some XSLT 1.0 processors. -->
	<xsl:param name="name"/>
	<xsl:template name="start" match="/">
		<html xml:lang="en" xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<style type="text/css">html{background-color:azure}
                body{font-family:Verdana, Arial, Helvetica, san-serif; background-color:azure}
                code{font-size:115%}
                h2, h3, h4{margin-top: 1.5em}
                table, tr, th, td{border: 1px solid silver; margin:1em 0em 1em 0em}
                tr{background-color:seashell}
                tr.th{background-color:silver}
                tr.altcolor{background-color:white}
                .negative{color:red}
                /* toc */
                ol.itoc, ul.itoc{list-style-type:none;margin-top: 0em; margin-bottom: 0em}
                .itoc li span span{font-size: 80%}                                
                /* none navy */
                #itoc a:link
                {color:navy; background-color: transparent; text-decoration: none}
                #itoc a:visited
                {color: navy; background-color: transparent; text-decoration: none}
                #itoc a:hover
                {color: red; background-color: transparent; text-decoration: underline}
                #itoc a:active
                {color: white; background-color: blue; text-decoration: none}
                #itoc a:focus
                {color: white; background-color: blue; text-decoration: none}                          
                .altc{color: black; background-color:#F5F5F5} /*white smoke*/                
                h2 span, h3 span, h4 span, h5 span, h6 span{font-size:80%}</style>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
				<title>Elements and functions available in <xsl:choose>
						<xsl:when test="system-property('xsl:version') = '2.0'">
							<xsl:value-of select="concat(system-property('xsl:product-name'), ' ', system-property('xsl:product-version'))"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="$name != ''">
									<xsl:value-of select="$name"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="system-property('xsl:vendor')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</title>
			</head>
			<body>
				<p>
					<small>Report based on <a href="http://www.xmlplease.com/%7Bdocument('')/xsl:stylesheet/dc:URI%7D">
							<xsl:value-of select="document('')/xsl:stylesheet/dc:title"/>
						</a>
						<xsl:if test="$date2 != '?'">
							<br />Report generated <xsl:value-of select="$date2"/>
						</xsl:if>
					</small>
				</p>
				<h1>
					<xsl:choose>
						<xsl:when test="system-property('xsl:version') = '2.0'">
							<xsl:value-of select="concat(system-property('xsl:product-name'), ' ', system-property('xsl:product-version'))"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="system-property('xsl:vendor')"/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text>: Elements and Functions Available</xsl:text>
				</h1>
				<p>
					<big>
						<xsl:choose>
							<xsl:when test="system-property('xsl:version') = '2.0'">
								<xsl:value-of select="concat('XSLT ', $version, '.0. ', 'Schema-aware: ', system-property('xsl:is-schema-aware'), '. ',  system-property('xsl:vendor'),', ')"/>
								<a href="http://www.xmlplease.com/%7Bsystem-property('xsl:vendor-url')%7D">
									<xsl:value-of select="system-property('xsl:vendor-url')"/>
								</a>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat('XSLT ', $version, '.0', ', ')"/>
								<a href="http://www.xmlplease.com/%7Bsystem-property('xsl:vendor-url')%7D">
									<xsl:value-of select="system-property('xsl:vendor-url')"/>
								</a>
							</xsl:otherwise>
						</xsl:choose>
					</big>
				</p>
				<ul id="itoc" class="itoc">
					<li>
						<span class="altc">
							<span>1. </span>
							<a href="#s1">The XSLT stylesheet behind the report</a>
						</span>
					</li>
					<li>
						<span>
							<span>2. </span>
							<a href="#s2">XSLT and XPath</a>
						</span>
						<ul class="itoc">
							<li>
								<span class="altc">
									<span>2.1 </span>
									<a href="#s2.1">XSLT/XPath 2.0 Functions</a>
								</span>
							</li>
							<li>
								<span>
									<span>2.2 </span>
									<a href="#s2.2">XSLT Elements</a>
								</span>
								<ul class="itoc">
									<li>
										<span class="altc">
											<span>2.2.1 </span>
											<a href="#s2.2.1">Warning</a>
										</span>
									</li>
								</ul>
							</li>
						</ul>
					</li>
					<li>
						<span>
							<span>3. </span>
							<a href="#s3">User-defined XSLT functions</a>
						</span>
					</li>
					<li>
						<span class="altc">
							<span>4. </span>
							<a href="#s4">Saxon Extensions</a>
						</span>
						<ul class="itoc">
							<li>
								<span>
									<span>4.1 </span>
									<a href="#s4.1">Saxon Extension Functions</a>
								</span>
							</li>
							<li>
								<span class="altc">
									<span>4.2 </span>
									<a href="#s4.2">Saxon Extension Elements</a>
								</span>
							</li>
						</ul>
					</li>
					<li>
						<span>
							<span>5. </span>
							<a href="#s5">EXSLT Extensions</a>
						</span>
						<ul class="itoc">
							<li>
								<span class="altc">
									<span>5.1 </span>
									<a href="#s5.1">EXSL Dates and Times Functions</a>
								</span>
							</li>
							<li>
								<span>
									<span>5.2 </span>
									<a href="#s5.2">EXSL Dates and Times Elements</a>
								</span>
							</li>
							<li>
								<span class="altc">
									<span>5.3 </span>
									<a href="#s5.3">EXSL Dynamic Functions</a>
								</span>
							</li>
							<li>
								<span>
									<span>5.4 </span>
									<a href="#s5.4">EXSL Common Functions</a>
								</span>
							</li>
							<li>
								<span class="altc">
									<span>5.5 </span>
									<a href="#s5.5">EXSL Common Elements</a>
								</span>
							</li>
							<li>
								<span>
									<span>5.6 </span>
									<a href="#s5.6">EXSL Functions Elements</a>
								</span>
							</li>
							<li>
								<span class="altc">
									<span>5.7 </span>
									<a href="#s5.7">EXSL Math Functions</a>
								</span>
							</li>
							<li>
								<span>
									<span>5.8 </span>
									<a href="#s5.8">EXSL Random Functions</a>
								</span>
							</li>
							<li>
								<span class="altc">
									<span>5.9 </span>
									<a href="#s5.9">EXSL Regular Expressions Functions</a>
								</span>
							</li>
							<li>
								<span>
									<span>5.10 </span>
									<a href="#s5.10">EXSL Sets Functions</a>
								</span>
							</li>
							<li>
								<span class="altc">
									<span>5.11 </span>
									<a href="#s5.11">EXSL String Functions</a>
								</span>
							</li>
						</ul>
					</li>
				</ul>
				<h2 id="s1">
					<span>1.</span> The XSLT stylesheet behind the report</h2>
				<p>With the help of the XSLT functions <code>element-available()</code> and
					<code>function-available()</code>, the XSLT stylesheet, <a href="http://www.xmlplease.com/element-function-available.xsl">element-function-available.xsl</a>, tests:</p>
				<ol>
					<li>
						<p>If instruction elements in XSLT and functions in XSLT and XPath are
							available in the XSLT processor.</p>
					</li>
					<li>
						<p>If EXSLT extensions are available.</p>
					</li>
					<li>
						<p>If proprietary Saxon extension instruction elements and functions are
							available in Saxon processors.</p>
					</li>
				</ol>
				<p>
					<strong>Note that:</strong>
				</p>
				<ul>
					<li>
						<p>AltovaXML supports no extensions of any kind. If the transformation takes
							place from inside an ordinary programming language the parameter method
							can help AltovaXML out.</p>
					</li>
					<li>
						<p>Many XSLT 1.0 processors have their own proprietary sets of extensions
							which I am not testing. We test for Saxon extensions because of the
							importance of Saxon in XSLT 2.0.</p>
					</li>
					<li>
						<p>There are other extensions than elements and functions which we can't
							test with <code>element-available()</code> and
								<code>function-available()</code>. <a href="http://www.saxonica.com/documentation/extensions/intro.html">Saxon extensions</a>, e.g., include a few extension attributes and
							additional serialization parameters.</p>
					</li>
					<li>
						<p>If an XSLT processor has a "script" extension element,
							often named "prefix:script", the programming languages supported can be
							used from inside the XSLT stylesheet. This makes it easy to use the
							functions of those programming languages when needed.</p>
					</li>
					<li><p>In e.g. Saxon, it is fairly easy to make additional extension functions in <a href="http://www.saxonica.com/documentation/extensibility/functions.html">Java</a> or <a href="http://www.saxonica.com/documentation/extensibility/dotnetextensions.html">.Net</a>. Example: <a href="http://www.fgeorges.org/xslt/saxon-ext/">XSLT 2.0 extensions for Saxon</a> made by Florent Georges.</p></li>
					<li>
						<p>We are only testing what the processor reports. We must use the element
							and function for real to see if it really is implemented or not and if
							the implementation is in accordance with the specs.</p>
					</li>
				</ul>
				<h2 id="s2">
					<span>2.</span> XSLT and XPath</h2>
				<h3 id="s2.1">
					<span>2.1</span> XSLT/XPath <xsl:value-of select="concat($version, '.0')"/> Functions</h3>
				<p>We can use <a href="http://www.w3.org/TR/xslt20/#function-function-available">function-available()</a> to test if an XSLT or XPath function or even an
					extension function is available in an XSLT processor. Right below we test for
					XSLT/XPath functions, later we are going to test for extension function.</p>
				<table cellspacing="0" cellpadding="5">
					<tr class="th">
						<th>No</th>
						<th>XSLT/XPath Function</th>
						<th>Available</th>
						<th>Spec</th>
					</tr>
					<xsl:for-each select="document('')/xsl:stylesheet/x:functions-xslt-path/*[number($version)]/*">
						<tr>
							<xsl:if test="position() mod 2 = 0">
								<xsl:attribute name="class">altcolor</xsl:attribute>
							</xsl:if>
							<xsl:if test="function-available(.) = false()">
								<xsl:attribute name="style">color:red</xsl:attribute>
							</xsl:if>
							<td>
								<xsl:value-of select="position()"/>
							</td>
							<td>
								<a href="http://www.xmlplease.com/%7B@href%7D">
									<xsl:value-of select="."/>
								</a>
							</td>
							<td>
								<xsl:value-of select="function-available(.)"/>
							</td>
							<td>
								<xsl:value-of select="@spec"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<h3 id="s2.2">
					<span>2.2</span> XSLT Elements</h3>
				<p>The XSLTstandards (Recommendations) say (2.0 more clearly than 1.0) that <a href="http://www.w3.org/TR/xslt20/#function-element-available">element-available()</a> is about instruction elements. This means that
					non-instruction elements like declaration elements, e.g. xsl:strip-space and
					xsl:output, and sub-elements of instruction elements like xsl:when and xsl:sort
					can't be tested with <code>element-available()</code>. It is very confusing that
					non-instruction elements return "false" as if they don't exist.</p>
				<p>Some XSLT processors like AltovaXML 2008 and MSXML 3.0 return true for all
					implemented elements. XMLSpy 2008 returns true for all elements except for
					xsl:strip-space (not implemented) and xsl-preserve-space (not implemented) and
					xsl:transform (implemented). The last one must be a bug.
						<code>Element-available()</code>would be more useful and less confusing if
					also Saxon returned "true" for any element implemented.</p>
				<h4 id="s2.2.1">
					<span>2.2.1</span> Warning</h4>
				<p>If <code>element-available()</code> returns "false" for all non-instruction elements, the
					"false" will be high-lighted with red but the elements are probably supported
					anyway. The "false" for non-instruction elements most often just means that the
					element is not an instruction element. If only some of the non-instruction
					elements return "false", as in AltovaXML, they are probably not available.</p>
				<p>If an instruction-element returns "false", we always have a real problem.</p>
				<table cellspacing="0" cellpadding="5">
					<tr class="th">
						<th>No</th>
						<th>XSLT Element</th>
						<th>Available</th>
					</tr>
					<xsl:for-each select="document('')/xsl:stylesheet/x:elements-xslt/*[number($version)]/*">
						<tr>
							<xsl:if test="position() mod 2 = 0">
								<xsl:attribute name="class">altcolor</xsl:attribute>
							</xsl:if>
							<xsl:if test="element-available(.) = false() and not(@instruction)">
								<xsl:attribute name="class">negative</xsl:attribute>
							</xsl:if>
							<td>
								<xsl:value-of select="position()"/>
							</td>
							<td>
								<a href="http://www.xmlplease.com/%7B@href%7D">
									<xsl:value-of select="."/>
								</a>
							</td>
							<td>
								<xsl:choose>
									<xsl:when test="@instruction = 'no'">
										<xsl:choose>
											<xsl:when test="element-available(.) = false()">
												<span class="negative">
													<xsl:value-of select="element-available(.)"/>
												</span>
												<xsl:text> </xsl:text>(not instruction)</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="concat(element-available(.), ' (not instruction)')"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="element-available(.)"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<h2 id="s3">
					<span>3.</span> User-defined XSLT functions</h2>
				<p>Before we continue with extension elements and functions, let us not forget
					user-defined XSLT functions. That is collections of functions using named
					templates, the xsl:function element in XSLT 2.0, etc., and based on standard
					XSLT functionality.</p>
				<p>Here is a list of some collections of user-defined XSLT-functions:</p>
				<ol>
					<li>
						<p>Priscilla Walmsley's <a href="http://www.xsltfunctions.com/xsl/">The
								FunctX XSLT 2.0 Function Library</a>. Here we have many small
							examples of how to use XSLT/XPath functions and additional user-defined
							functions using the "functx" prefix.</p>
					</li>
					<li>
						<p>Peter Rushforth's <a href="http://sourceforge.net/projects/geofunctions/">Geofunctions</a>, an open-source library of XSLT / functions,
							templates, stylesheets and classes devoted to the processing of
							geographic data in XML.</p>
					</li>
					<li>
						<p>Dimitre Novatchev's <a href="http://fxsl.sourceforge.net/">FXSL</a>, "the
							functional programming library for XSLT".</p>
					</li>
					<li>Xia Li's function library that enables applications to use <a href="http://www.ibm.com/developerworks/xml/library/x-schemanode/">XPath
							2.0 schema-related node tests</a>.</li>
				</ol>
				<h2 id="s4">
					<span>4.</span> Saxon Extensions</h2>
				<p>Saxon's extensions are not necessarily relevant for Saxon only. If you use
					another XSLT processor, it can be nice to know what extensions are available in
					the trendsetting Saxon XSLT 2.0 processor. It can give you a hint for what to
					look or ask for in the XSLT processor you use. If some new XSLT 2.0 processor
					needs extensions, why not implement Saxon's?</p>
				<p>A few of Saxon's extensions are only available in the "SA" (schema-aware)
					version.</p>
				<h3 id="s4.1">
					<span>4.1</span> Saxon Extension Functions</h3>
				<p>Many of <a href="http://www.saxonica.com/documentation/extensions/functions.html">Saxon's extension functions</a> are unique, adding functionality to
					XSLT.2.0</p>
				<table cellspacing="0" cellpadding="5">
					<tr class="th">
						<th>No</th>
						<th>Saxon Function</th>
						<th>Available</th>
					</tr>
					<xsl:for-each select="document('')/xsl:stylesheet/x:functions-saxon/*">
						<tr>
							<xsl:if test="position() mod 2 = 0">
								<xsl:attribute name="class">altcolor</xsl:attribute>
							</xsl:if>
							<xsl:if test="function-available(.) = false()">
								<xsl:attribute name="style">color:red</xsl:attribute>
							</xsl:if>
							<td>
								<xsl:value-of select="position()"/>
							</td>
							<td>
								<a href="http://www.xmlplease.com/%7B@href%7D">
									<xsl:value-of select="."/>
								</a>
							</td>
							<td>
								<xsl:value-of select="function-available(.)"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<h3 id="s4.2">
					<span>4.2</span> Saxon Extension Elements</h3>
				<p>Many of <a href="http://www.saxonica.com/documentation/extensions/instructions.html">Saxon's extension elements</a> are unique, adding functionality to XSLT.2.0</p>
				<table cellspacing="0" cellpadding="5">
					<tr class="th">
						<th>No</th>
						<th>Saxon Element</th>
						<th>Available</th>
					</tr>
					<xsl:for-each select="document('')/xsl:stylesheet/x:elements-saxon/*">
						<tr>
							<xsl:if test="position() mod 2 = 0">
								<xsl:attribute name="class">altcolor</xsl:attribute>
							</xsl:if>
							<xsl:if test="element-available(.) = false() and not(@instruction)">
								<xsl:attribute name="style">color:red</xsl:attribute>
							</xsl:if>
							<td>
								<xsl:value-of select="position()"/>
							</td>
							<td>
								<a href="http://www.xmlplease.com/%7B@href%7D">
									<xsl:value-of select="."/>
								</a>
							</td>
							<td>
								<xsl:choose>
									<xsl:when test="@instruction = 'no'">
										<xsl:choose>
											<xsl:when test="element-available(.) = false()">
												<span class="negative">
													<xsl:value-of select="element-available(.)"/>
												</span>
												<xsl:text> </xsl:text>(not instruction)</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="concat(element-available(.), ' (not instruction)')"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="element-available(.)"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<h2 id="s5">
					<span>5.</span> EXSLT Extensions</h2>
				<p>EXSLT is a community initiative to provide extensions to XSLT. This was needed
					for XSLT 1.0 having limited functionality and very few functions. Almost
					anything in EXSLT made it into XSLT 2.0 making EXSLT less relevant today with
					few exceptions like the math functions. EXSLT is still a necessity if we must
					make stylesheets that work both in XSLT 2.0 processors an in XSLT 1.0
					processors.</p>
				<h3 id="s5.1">
					<span>5.1</span> EXSL Dates and Times Functions</h3>
				<p>Except for <code>date:parse-date()</code> the functions in <a href="http://www.exslt.org/date/index.html">EXSLT DATES AND TIMES</a> are
					irrelevant in XSLT 2.0 having similar functions. If we need to make stylesheets
					that work both in XSLT 2.0 and in XSLT 1.0, EXSL extensions can some times help
					us out if supported in older XSLT processors.</p>
				<table cellspacing="0" cellpadding="5">
					<tr class="th">
						<th>No</th>
						<th>EXSL Function</th>
						<th>Available</th>
					</tr>
					<xsl:for-each select="document('')/xsl:stylesheet/x:exslt/x:exsl-date/x:function">
						<tr>
							<xsl:if test="position() mod 2 = 0">
								<xsl:attribute name="class">altcolor</xsl:attribute>
							</xsl:if>
							<xsl:if test="function-available(.) = false()">
								<xsl:attribute name="style">color:red</xsl:attribute>
							</xsl:if>
							<td>
								<xsl:value-of select="position()"/>
							</td>
							<td>
								<a href="http://www.xmlplease.com/%7B@href%7D">
									<xsl:value-of select="."/>
								</a>
							</td>
							<td>
								<xsl:value-of select="function-available(.)"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<h3 id="s5.2">
					<span>5.2</span> EXSL Dates and Times Elements</h3>
				<p>Extension element in <a href="http://www.exslt.org/date/index.html">EXSLT DATES
						AND TIMES</a> is irrelevant in XSLT 2.0 having a similar element.</p>
				<table cellspacing="0" cellpadding="5">
					<tr class="th">
						<th>No</th>
						<th>EXSL Element</th>
						<th>Available</th>
					</tr>
					<xsl:for-each select="document('')/xsl:stylesheet/x:exslt/x:exsl-date/x:element">
						<tr>
							<xsl:if test="position() mod 2 = 0">
								<xsl:attribute name="class">altcolor</xsl:attribute>
							</xsl:if>
							<xsl:if test="element-available(.) = false() and not(@instruction)">
								<xsl:attribute name="style">color:red</xsl:attribute>
							</xsl:if>
							<td>
								<xsl:value-of select="position()"/>
							</td>
							<td>
								<a href="http://www.xmlplease.com/%7B@href%7D">
									<xsl:value-of select="."/>
								</a>
							</td>
							<td>
								<xsl:choose>
									<xsl:when test="@instruction = 'no'">
										<xsl:choose>
											<xsl:when test="element-available(.) = false()">
												<span class="negative">
													<xsl:value-of select="element-available(.)"/>
												</span>
												<xsl:text> </xsl:text>(not instruction)</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="concat(element-available(.), ' (not instruction)')"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="element-available(.)"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<h3 id="s5.3">
					<span>5.3</span> EXSL Dynamic Functions</h3>
				<p>Except for <code>dyn:evaluate()</code> the functions in <a href="http://www.exslt.org/dyn/index.html">EXSLT - DYNAMIC</a> are
					irrelevant in XSLT/XPath 2.0 having similar functions. Saxon has a better and
					more complete set of "evaluate" functions. "Evaluate" makes it possible to
					create XPath expressions dynamically. Expressions in pure XPath can not be
					created dynamically except that predicates can contain variables.</p>
				<table cellspacing="0" cellpadding="5">
					<tr class="th">
						<th>No</th>
						<th>EXSL Function</th>
						<th>Available</th>
					</tr>
					<xsl:for-each select="document('')/xsl:stylesheet/x:exslt/x:exsl-dyn/x:function">
						<tr>
							<xsl:if test="position() mod 2 = 0">
								<xsl:attribute name="class">altcolor</xsl:attribute>
							</xsl:if>
							<xsl:if test="function-available(.) = false()">
								<xsl:attribute name="style">color:red</xsl:attribute>
							</xsl:if>
							<td>
								<xsl:value-of select="position()"/>
							</td>
							<td>
								<a href="http://www.xmlplease.com/%7B@href%7D">
									<xsl:value-of select="."/>
								</a>
							</td>
							<td>
								<xsl:value-of select="function-available(.)"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<h3 id="s5.4">
					<span>5.4</span> EXSL Common Functions</h3>
				<p>Functions in <a href="http://www.exslt.org/exsl/index.html">EXSLT Common</a> are
					irrelevant in XSLT/XPath 2.0 having similar functions.</p>
				<table cellspacing="0" cellpadding="5">
					<tr class="th">
						<th>No</th>
						<th>EXSL Function</th>
						<th>Available</th>
					</tr>
					<xsl:for-each select="document('')/xsl:stylesheet/x:exslt/x:exsl-common/x:function">
						<tr>
							<xsl:if test="position() mod 2 = 0">
								<xsl:attribute name="class">altcolor</xsl:attribute>
							</xsl:if>
							<xsl:if test="function-available(.) = false()">
								<xsl:attribute name="style">color:red</xsl:attribute>
							</xsl:if>
							<td>
								<xsl:value-of select="position()"/>
							</td>
							<td>
								<a href="http://www.xmlplease.com/%7B@href%7D">
									<xsl:value-of select="."/>
								</a>
							</td>
							<td>
								<xsl:value-of select="function-available(.)"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<h3 id="s5.5">
					<span>5.5</span> EXSL Common Elements</h3>
				<p>Elements in <a href="http://www.exslt.org/exsl/index.html">EXSLT Common</a> are
					irrelevant in XSLT 2.0 having similar elements.</p>
				<table cellspacing="0" cellpadding="5">
					<tr class="th">
						<th>No</th>
						<th>EXSL Element</th>
						<th>Available</th>
					</tr>
					<xsl:for-each select="document('')/xsl:stylesheet/x:exslt/x:exsl-common/x:element">
						<tr>
							<xsl:if test="position() mod 2 = 0">
								<xsl:attribute name="class">altcolor</xsl:attribute>
							</xsl:if>
							<xsl:if test="element-available(.) = false() and not(@instruction)">
								<xsl:attribute name="style">color:red</xsl:attribute>
							</xsl:if>
							<td>
								<xsl:value-of select="position()"/>
							</td>
							<td>
								<a href="http://www.xmlplease.com/%7B@href%7D">
									<xsl:value-of select="."/>
								</a>
							</td>
							<td>
								<xsl:choose>
									<xsl:when test="@instruction = 'no'">
										<xsl:choose>
											<xsl:when test="element-available(.) = false()">
												<span class="negative">
													<xsl:value-of select="element-available(.)"/>
												</span>
												<xsl:text> </xsl:text>(not instruction)</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="concat(element-available(.), ' (not instruction)')"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="element-available(.)"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<h3 id="s5.6">
					<span>5.6</span> EXSL Functions Elements</h3>
				<p>Elements in <a href="http://www.exslt.org/func/index.html">EXSLT Functions</a>
					are irrelevant in XSLT/XPath 2.0 having similar elements.</p>
				<table cellspacing="0" cellpadding="5">
					<tr class="th">
						<th>No</th>
						<th>EXSL Element</th>
						<th>Available</th>
					</tr>
					<xsl:for-each select="document('')/xsl:stylesheet/x:exslt/x:exsl-functions/x:element">
						<tr>
							<xsl:if test="position() mod 2 = 0">
								<xsl:attribute name="class">altcolor</xsl:attribute>
							</xsl:if>
							<xsl:if test="element-available(.) = false() and not(@instruction)">
								<xsl:attribute name="style">color:red</xsl:attribute>
							</xsl:if>
							<td>
								<xsl:value-of select="position()"/>
							</td>
							<td>
								<a href="http://www.xmlplease.com/%7B@href%7D">
									<xsl:value-of select="."/>
								</a>
							</td>
							<td>
								<xsl:choose>
									<xsl:when test="@instruction = 'no'">
										<xsl:choose>
											<xsl:when test="element-available(.) = false()">
												<span class="negative">
													<xsl:value-of select="element-available(.)"/>
												</span>
												<xsl:text> </xsl:text>(not instruction)</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="concat(element-available(.), ' (not instruction)')"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="element-available(.)"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<h3 id="s5.7">
					<span>5.7</span> EXSL Math Functions</h3>
				<p>Most of the functions in <a href="http://www.exslt.org/math/index.html">EXSLT
						Math</a> are still very relevant in XSLT 2.0.</p>
				<table cellspacing="0" cellpadding="5">
					<tr class="th">
						<th>No</th>
						<th>EXSL Function</th>
						<th>Available</th>
					</tr>
					<xsl:for-each select="document('')/xsl:stylesheet/x:exslt/x:exsl-math/x:function">
						<tr>
							<xsl:if test="position() mod 2 = 0">
								<xsl:attribute name="class">altcolor</xsl:attribute>
							</xsl:if>
							<xsl:if test="function-available(.) = false()">
								<xsl:attribute name="style">color:red</xsl:attribute>
							</xsl:if>
							<td>
								<xsl:value-of select="position()"/>
							</td>
							<td>
								<a href="http://www.xmlplease.com/%7B@href%7D">
									<xsl:value-of select="."/>
								</a>
							</td>
							<td>
								<xsl:value-of select="function-available(.)"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<h3 id="s5.8">
					<span>5.8</span> EXSL Random Functions</h3>
				<p>The <code>random()</code> function in <a href="http://www.exslt.org/random/index.html">EXSLT Random</a> is still
					relevant in XSLT 2.0.</p>
				<table cellspacing="0" cellpadding="5">
					<tr class="th">
						<th>No</th>
						<th>EXSL Function</th>
						<th>Available</th>
					</tr>
					<xsl:for-each select="document('')/xsl:stylesheet/x:exslt/x:exsl-random/x:function">
						<tr>
							<xsl:if test="position() mod 2 = 0">
								<xsl:attribute name="class">altcolor</xsl:attribute>
							</xsl:if>
							<xsl:if test="function-available(.) = false()">
								<xsl:attribute name="style">color:red</xsl:attribute>
							</xsl:if>
							<td>
								<xsl:value-of select="position()"/>
							</td>
							<td>
								<a href="http://www.xmlplease.com/%7B@href%7D">
									<xsl:value-of select="."/>
								</a>
							</td>
							<td>
								<xsl:value-of select="function-available(.)"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<h3 id="s5.9">
					<span>5.9</span> EXSL Regular Expressions Functions</h3>
				<p>Functions in <a href="http://www.exslt.org/regexp/index.html">EXSLT Regular
						Expressions</a> are irrelevant in XSLT/XPath 2.0 having similar
					functionality.</p>
				<table cellspacing="0" cellpadding="5">
					<tr class="th">
						<th>No</th>
						<th>EXSL Function</th>
						<th>Available</th>
					</tr>
					<xsl:for-each select="document('')/xsl:stylesheet/x:exslt/x:exsl-regexp/x:function">
						<tr>
							<xsl:if test="position() mod 2 = 0">
								<xsl:attribute name="class">altcolor</xsl:attribute>
							</xsl:if>
							<xsl:if test="function-available(.) = false()">
								<xsl:attribute name="style">color:red</xsl:attribute>
							</xsl:if>
							<td>
								<xsl:value-of select="position()"/>
							</td>
							<td>
								<a href="http://www.xmlplease.com/%7B@href%7D">
									<xsl:value-of select="."/>
								</a>
							</td>
							<td>
								<xsl:value-of select="function-available(.)"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<h3 id="s5.10">
					<span>5.10</span> EXSL Sets Functions</h3>
				<p>Functions in <a href="http://www.exslt.org/set/index.html">EXSLT Sets</a> are
					irrelevant in XSLT/XPath 2.0 having similar functionality.</p>
				<table cellspacing="0" cellpadding="5">
					<tr class="th">
						<th>No</th>
						<th>EXSL Function</th>
						<th>Available</th>
					</tr>
					<xsl:for-each select="document('')/xsl:stylesheet/x:exslt/x:exsl-set/x:function">
						<tr>
							<xsl:if test="position() mod 2 = 0">
								<xsl:attribute name="class">altcolor</xsl:attribute>
							</xsl:if>
							<xsl:if test="function-available(.) = false()">
								<xsl:attribute name="style">color:red</xsl:attribute>
							</xsl:if>
							<td>
								<xsl:value-of select="position()"/>
							</td>
							<td>
								<a href="http://www.xmlplease.com/%7B@href%7D">
									<xsl:value-of select="."/>
								</a>
							</td>
							<td>
								<xsl:value-of select="function-available(.)"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<h3 id="s5.11">
					<span>5.11</span> EXSL String Functions</h3>
				<p>Functions in <a href="http://www.exslt.org/str/index.html">EXSLT Strings</a> are
					irrelevant in XSLT 2.0 having similar functionality.</p>
				<table cellspacing="0" cellpadding="5">
					<tr class="th">
						<th>No</th>
						<th>EXSL Function</th>
						<th>Available</th>
					</tr>
					<xsl:for-each select="document('')/xsl:stylesheet/x:exslt/x:exsl-str/x:function">
						<tr>
							<xsl:if test="position() mod 2 = 0">
								<xsl:attribute name="class">altcolor</xsl:attribute>
							</xsl:if>
							<xsl:if test="function-available(.) = false()">
								<xsl:attribute name="style">color:red</xsl:attribute>
							</xsl:if>
							<td>
								<xsl:value-of select="position()"/>
							</td>
							<td>
								<a href="http://www.xmlplease.com/%7B@href%7D">
									<xsl:value-of select="."/>
								</a>
							</td>
							<td>
								<xsl:value-of select="function-available(.)"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<p>END</p>
			</body>
		</html>
	</xsl:template>
	<x:functions-xslt-path>
		<x:functions-10>
			<x:function href="http://www.w3.org/TR/xpath#function-boolean" spec="XPath">boolean</x:function>
			<x:function href="http://www.w3.org/TR/xpath#function-ceiling" spec="XPath">ceiling</x:function>
			<x:function href="http://www.w3.org/TR/xpath#function-concat" spec="XPath">concat</x:function>
			<x:function href="http://www.w3.org/TR/xpath#function-contains" spec="XPath">contains</x:function>
			<x:function href="http://www.w3.org/TR/xpath#function-count" spec="XPath">count</x:function>
			<x:function href="http://www.w3.org/TR/xslt#function-current" spec="XSLT">current</x:function>
			<x:function href="http://www.w3.org/TR/xslt#function-document" spec="XSLT">document</x:function>
			<x:function href="http://www.w3.org/TR/xslt#function-element-available" spec="XSLT">element-available</x:function>
			<x:function href="http://www.w3.org/TR/xpath#function-false" spec="XPath">false</x:function>
			<x:function href="http://www.w3.org/TR/xslt#function-format-number" spec="XSLT">format-number</x:function>
			<x:function href="http://www.w3.org/TR/xslt#function-function-available" spec="XSLT">function-available</x:function>
			<x:function href="http://www.w3.org/TR/xslt#function-generate-id" spec="XSLT">generate-id</x:function>
			<x:function href="http://www.w3.org/TR/xpath#function-id" spec="XPath">id</x:function>
			<x:function href="http://www.w3.org/TR/xslt#function-key" spec="XSLT">key</x:function>
			<x:function href="http://www.w3.org/TR/xpath#function-lang" spec="XPath">lang</x:function>
			<x:function href="http://www.w3.org/TR/xpath#function-last" spec="XPath">last</x:function>
			<x:function href="http://www.w3.org/TR/xpath#function-local-name" spec="XPath">local-name</x:function>
			<x:function href="http://www.w3.org/TR/xpath#function-name" spec="XPath">name</x:function>
			<x:function href="http://www.w3.org/TR/xpath#function-namespace-uri" spec="XPath">namespace-uri</x:function>
			<x:function href="http://www.w3.org/TR/xpath#function-normalize-space" spec="XPath">normalize-space</x:function>
			<x:function href="http://www.w3.org/TR/xpath#function-not" spec="XPath">not</x:function>
			<x:function href="http://www.w3.org/TR/xpath#function-number" spec="XPath">number</x:function>
			<x:function href="http://www.w3.org/TR/xpath#function-position" spec="XPath">position</x:function>
			<x:function href="http://www.w3.org/TR/xpath#function-round" spec="XPath">round</x:function>
			<x:function href="http://www.w3.org/TR/xpath#function-starts-with" spec="XPath">starts-with</x:function>
			<x:function href="http://www.w3.org/TR/xpath#function-string" spec="XPath">string</x:function>
			<x:function href="http://www.w3.org/TR/xpath#function-string-length" spec="XPath">string-length</x:function>
			<x:function href="http://www.w3.org/TR/xpath#function-substring" spec="XPath">substring</x:function>
			<x:function href="http://www.w3.org/TR/xpath#function-substring-after" spec="XPath">substring-after</x:function>
			<x:function href="http://www.w3.org/TR/xpath#function-substring-before" spec="XPath">substring-before</x:function>
			<x:function href="http://www.w3.org/TR/xpath#function-sum" spec="XPath">sum</x:function>
			<x:function href="http://www.w3.org/TR/xslt#function-system-property" spec="XSLT">system-property</x:function>
			<x:function href="http://www.w3.org/TR/xpath#function-translate" spec="XPath">translate</x:function>
			<x:function href="http://www.w3.org/TR/xpath#function-true" spec="XPath">true</x:function>
			<x:function href="http://www.w3.org/TR/xslt#function-unparsed-entity-uri" spec="XSLT">unparsed-entity-uri</x:function>
		</x:functions-10>
		<x:functions-20>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-abs" spec="XPath">abs</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-adjust-date-to-timezone" spec="XPath">adjust-date-to-timezone</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-adjust-dateTime-to-timezone" spec="XPath">adjust-dateTime-to-timezone</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-adjust-time-to-timezone" spec="XPath">adjust-time-to-timezone</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-avg" spec="XPath">avg</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-base-uri" spec="XPath">base-uri</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-boolean" spec="XPath">boolean</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-ceiling" spec="XPath">ceiling</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-codepoint-equal" spec="XPath">codepoint-equal</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-codepoints-to-string" spec="XPath">codepoints-to-string</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-collection" spec="XPath">collection</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-compare" spec="XPath">compare</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-concat" spec="XPath">concat</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-contains" spec="XPath">contains</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-count" spec="XPath">count</x:function>
			<x:function href="http://www.w3.org/TR/xslt20/#function-current" spec="XSLT">current</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-current-date" spec="XPath">current-date</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-current-dateTime" spec="XPath">current-dateTime</x:function>
			<x:function href="http://www.w3.org/TR/xslt20/#function-current-group" spec="XSLT">current-group</x:function>
			<x:function href="http://www.w3.org/TR/xslt20/#function-current-grouping-key" spec="XSLT">current-grouping-key</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-current-time" spec="XPath">current-time</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-data" spec="XPath">data</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-dateTime" spec="XPath">dateTime</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-day-from-date" spec="XPath">day-from-date</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-day-from-dateTime" spec="XPath">day-from-dateTime</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-days-from-duration" spec="XPath">days-from-duration</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-deep-equal" spec="XPath">deep-equal</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-default-collation" spec="XPath">default-collation</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-distinct-values" spec="XPath">distinct-values</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-doc" spec="XPath">doc</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-doc-available" spec="XPath">doc-available</x:function>
			<x:function href="http://www.w3.org/TR/xslt20/#function-document" spec="XSLT">document</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-document-uri" spec="XPath">document-uri</x:function>
			<x:function href="http://www.w3.org/TR/xslt20/#function-element-available" spec="XSLT">element-available</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-empty" spec="XPath">empty</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-encode-for-uri" spec="XPath">encode-for-uri</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-ends-with" spec="XPath">ends-with</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-error" spec="XPath">error</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-escape-html-uri" spec="XPath">escape-html-uri</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-exactly-one" spec="XPath">exactly-one</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-exists" spec="XPath">exists</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-false" spec="XPath">false</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-floor" spec="XPath">floor</x:function>
			<x:function href="http://www.w3.org/TR/xslt20/#function-format-date" spec="XSLT">format-date</x:function>
			<x:function href="http://www.w3.org/TR/xslt20/#function-format-dateTime" spec="XSLT">format-dateTime</x:function>
			<x:function href="http://www.w3.org/TR/xslt20/#function-format-number" spec="XSLT">format-number</x:function>
			<x:function href="http://www.w3.org/TR/xslt20/#function-format-time" spec="XSLT">format-time</x:function>
			<x:function href="http://www.w3.org/TR/xslt20/#function-function-available" spec="XSLT">function-available</x:function>
			<x:function href="http://www.w3.org/TR/xslt20/#function-generate-id" spec="XSLT">generate-id</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-hours-from-dateTime" spec="XPath">hours-from-dateTime</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-hours-from-duration" spec="XPath">hours-from-duration</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-hours-from-time" spec="XPath">hours-from-time</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-id" spec="XPath">id</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-idref" spec="XPath">idref</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-implicit-timezone" spec="XPath">implicit-timezone</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-in-scope-prefixes" spec="XPath">in-scope-prefixes</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-index-of" spec="XPath">index-of</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-insert-before" spec="XPath">insert-before</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-iri-to-uri" spec="XPath">iri-to-uri</x:function>
			<x:function href="http://www.w3.org/TR/xslt20/#function-key" spec="XSLT">key</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-lang" spec="XPath">lang</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-last" spec="XPath">last</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-local-name" spec="XPath">local-name</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-local-name-from-QName" spec="XPath">local-name-from-QName</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-lower-case" spec="XPath">lower-case</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-matches" spec="XPath">matches</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-max" spec="XPath">max</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-min" spec="XPath">min</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-minutes-from-dateTime" spec="XPath">minutes-from-dateTime</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-minutes-from-duration" spec="XPath">minutes-from-duration</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-minutes-from-time" spec="XPath">minutes-from-time</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-month-from-date" spec="XPath">month-from-date</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-month-from-dateTime" spec="XPath">month-from-dateTime</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-months-from-duration" spec="XPath">months-from-duration</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-name" spec="XPath">name</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-namespace-uri" spec="XPath">namespace-uri</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-namespace-uri-for-prefix" spec="XPath">namespace-uri-for-prefix</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-namespace-uri-from-QName" spec="XPath">namespace-uri-from-QName</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-nilled" spec="XPath">nilled</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-node-name" spec="XPath">node-name</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-normalize-space" spec="XPath">normalize-space</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-normalize-unicode" spec="XPath">normalize-unicode</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-not" spec="XPath">not</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-number" spec="XPath">number</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-one-or-more" spec="XPath">one-or-more</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-position" spec="XPath">position</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-prefix-from-QName" spec="XPath">prefix-from-QName</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-QName" spec="XPath">QName</x:function>
			<x:function href="http://www.w3.org/TR/xslt20/#function-regex-group" spec="XSLT">regex-group</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-remove" spec="XPath">remove</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-replace" spec="XPath">replace</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-resolve-QName" spec="XPath">resolve-QName</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-resolve-uri" spec="XPath">resolve-uri</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-reverse" spec="XPath">reverse</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-root" spec="XPath">root</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-round" spec="XPath">round</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-round-half-to-even" spec="XPath">round-half-to-even</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-seconds-from-dateTime" spec="XPath">seconds-from-dateTime</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-seconds-from-duration" spec="XPath">seconds-from-duration</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-seconds-from-time" spec="XPath">seconds-from-time</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-starts-with" spec="XPath">starts-with</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-static-base-uri" spec="XPath">static-base-uri</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-string" spec="XPath">string</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-string-join" spec="XPath">string-join</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-string-length" spec="XPath">string-length</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-string-to-codepoints" spec="XPath">string-to-codepoints</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-subsequence" spec="XPath">subsequence</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-substring" spec="XPath">substring</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-substring-after" spec="XPath">substring-after</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-substring-before" spec="XPath">substring-before</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-sum" spec="XPath">sum</x:function>
			<x:function href="http://www.w3.org/TR/xslt20/#function-system-property" spec="XSLT">system-property</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-timezone-from-date" spec="XPath">timezone-from-date</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-timezone-from-dateTime" spec="XPath">timezone-from-dateTime</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-timezone-from-time" spec="XPath">timezone-from-time</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-tokenize" spec="XPath">tokenize</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-trace" spec="XPath">trace</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-translate" spec="XPath">translate</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-true" spec="XPath">true</x:function>
			<x:function href="http://www.w3.org/TR/xslt20/#function-type-available" spec="XSLT">type-available</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-unordered" spec="XPath">unordered</x:function>
			<x:function href="http://www.w3.org/TR/xslt20/#function-unparsed-entity-public-id" spec="XSLT">unparsed-entity-public-id</x:function>
			<x:function href="http://www.w3.org/TR/xslt20/#function-unparsed-entity-uri" spec="XSLT">unparsed-entity-uri</x:function>
			<x:function href="http://www.w3.org/TR/xslt20/#function-unparsed-text" spec="XSLT">unparsed-text</x:function>
			<x:function href="http://www.w3.org/TR/xslt20/#function-unparsed-text-available" spec="XSLT">unparsed-text-available</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-upper-case" spec="XPath">upper-case</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-year-from-date" spec="XPath">year-from-date</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-year-from-dateTime" spec="XPath">year-from-dateTime</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-years-from-duration" spec="XPath">years-from-duration</x:function>
			<x:function href="http://www.w3.org/TR/xpath-functions/#func-zero-or-one" spec="XPath">zero-or-one</x:function>
		</x:functions-20>
	</x:functions-xslt-path>
	<x:elements-xslt>
		<x:elements-10>
			<x:element href="http://www.w3.org/TR/xslt#element-apply-imports">xsl:apply-imports</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-apply-templates">xsl:apply-templates</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-attribute">xsl:attribute</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-attribute-set" instruction="no">xsl:attribute-set</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-call-template">xsl:call-template</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-choose">xsl:choose</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-comment">xsl:comment</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-copy">xsl:copy</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-copy-of">xsl:copy-of</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-decimal-format" instruction="no">xsl:decimal-format</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-element">xsl:element</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-fallback">xsl:fallback</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-for-each">xsl:for-each</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-if">xsl:if</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-import" instruction="no">xsl:import</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-include" instruction="no">xsl:include</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-key" instruction="no">xsl:key</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-message">xsl:message</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-namespace-alias" instruction="no">xsl:namespace-alias</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-number">xsl:number</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-otherwise" instruction="no">xsl:otherwise</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-output" instruction="no">xsl:output</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-param" instruction="no">xsl:param</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-preserve-space" instruction="no">xsl:preserve-space</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-processing-instruction">xsl:processing-instruction</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-sort" instruction="no">xsl:sort</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-strip-space" instruction="no">xsl:strip-space</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-stylesheet" instruction="no">xsl:stylesheet</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-template" instruction="no">xsl:template</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-text">xsl:text</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-transform" instruction="no">xsl:transform</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-value-of">xsl:value-of</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-variable">xsl:variable</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-when" instruction="no">xsl:when</x:element>
			<x:element href="http://www.w3.org/TR/xslt#element-with-param" instruction="no">xsl:with-param</x:element>
		</x:elements-10>
		<x:elements-20>
			<x:element href="http://www.w3.org/TR/xslt20/#element-analyze-string">xsl:analyze-string</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-apply-imports">xsl:apply-imports</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-apply-templates">xsl:apply-templates</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-attribute">xsl:attribute</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-attribute-set" instruction="no">xsl:attribute-set</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-call-template">xsl:call-template</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-character-map" instruction="no">xsl:character-map</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-choose">xsl:choose</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-comment">xsl:comment</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-copy">xsl:copy</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-copy-of">xsl:copy-of</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-decimal-format" instruction="no">xsl:decimal-format</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-document">xsl:document</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-element">xsl:element</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-fallback">xsl:fallback</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-for-each">xsl:for-each</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-for-each-group">xsl:for-each-group</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-function" instruction="no">xsl:function</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-if">xsl:if</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-import" instruction="no">xsl:import</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-import-schema" instruction="no">xsl:import-schema</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-include" instruction="no">xsl:include</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-key" instruction="no">xsl:key</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-matching-substring" instruction="no">xsl:matching-substring</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-message">xsl:message</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-namespace">xsl:namespace</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-namespace-alias" instruction="no">xsl:namespace-alias</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-next-match">xsl:next-match</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-non-matching-substring" instruction="no">xsl:non-matching-substring</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-number">xsl:number</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-otherwise" instruction="no">xsl:otherwise</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-output" instruction="no">xsl:output</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-output-character" instruction="no">xsl:output-character</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-param" instruction="no">xsl:param</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-perform-sort">xsl:perform-sort</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-preserve-space" instruction="no">xsl:preserve-space</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-processing-instruction">xsl:processing-instruction</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-result-document">xsl:result-document</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-sequence">xsl:sequence</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-sort" instruction="no">xsl:sort</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-strip-space" instruction="no">xsl:strip-space</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-stylesheet" instruction="no">xsl:stylesheet</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-template" instruction="no">xsl:template</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-text">xsl:text</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-transform" instruction="no">xsl:transform</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-value-of">xsl:value-of</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-variable">xsl:variable</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-when" instruction="no">xsl:when</x:element>
			<x:element href="http://www.w3.org/TR/xslt20/#element-with-param" instruction="no">xsl:with-param</x:element>
		</x:elements-20>
	</x:elements-xslt>
	<x:functions-saxon>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/analyze-string.html">saxon:analyze-string</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/base64binarytooctets.html">saxon:base64Binary-to-octets</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/base64binarytostring.html">saxon:base64Binary-to-string</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/call.html">saxon:call</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/columnnumber.html">saxon:column-number</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/compile-query.html">saxon:compile-query</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/compile-stylesheet.html">saxon:compile-stylesheet</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/decimaldivide.html">saxon:decimal-divide</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/deepequal.html">saxon:deep-equal</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/discarddocument.html">saxon:discard-document</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/eval.html">saxon:eval</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/evaluate.html">saxon:evaluate</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/evaluate-node.html">saxon:evaluate-node</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/expression.html">saxon:expression</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/file-last-modified.html">saxon:file-last-modified</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/find.html">saxon:find</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/for-each-group.html">saxon:for-each-group</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/format-dateTime.html">saxon:format-dateTime</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/format-number.html">saxon:format-number</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/function.html">saxon:function</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/generateid.html">saxon:generate-id</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/getpseudoattribute.html">saxon:get-pseudo-attribute</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/hassamenodes.html">saxon:has-same-nodes</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/hexBinarytooctets.html">saxon:hexBinary-to-octets</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/hexBinarytostring.html">saxon:hexBinary-to-string</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/highest.html">saxon:highest</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/index.html">saxon:index</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/in-summer-time.html">saxon:in-summer-time</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/is-whole-number.html">saxon:is-whole-number</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/item-at.html">saxon:item-at</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/last-modified.html">saxon:last-modified</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/leading.html">saxon:leading</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/linenumber.html">saxon:line-number</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/lowest.html">saxon:lowest</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/namespace-node.html">saxon:namespace-node</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/stream.html">saxon:stream</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/octetstobase64Binary.html">saxon:octets-to-base64Binary</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/octetstohexBinary.html">saxon:octets-to-hexBinary</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/parse.html">saxon:parse</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/path.html">saxon:path</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/printstack.html">saxon:print-stack</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/query.html">saxon:query</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/result-document.html">saxon:result-document</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/serialize.html">saxon:serialize</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/sort.html">saxon:sort</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/string-to-base64Binary.html">saxon:string-to-base64Binary</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/string-to-hexBinary.html">saxon:string-to-hexBinary</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/stringtoutf8.html">saxon:string-to-utf8</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/systemid.html">saxon:system-id</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/transform.html">saxon:transform</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/try.html">saxon:try</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/typeannotation.html">saxon:type-annotation</x:function>
		<x:function href="http://www.saxonica.com/documentation/extensions/functions/unparsedentities.html">saxon:unparsed-entities</x:function>
	</x:functions-saxon>
	<x:elements-saxon>
		<x:element href="http://www.saxonica.com/documentation/extensions/instructions/assign.html">saxon:assign</x:element>
		<x:element href="http://www.saxonica.com/documentation/extensions/instructions/break.html" instruction="no">saxon:break</x:element>
		<x:element href="http://www.saxonica.com/documentation/extensions/instructions/call-template.html">saxon:call-template</x:element>
		<x:element href="http://www.saxonica.com/documentation/extensions/instructions/collation.html" instruction="no">saxon:collation</x:element>
		<x:element href="http://www.saxonica.com/documentation/extensions/instructions/doctype.html">saxon:doctype</x:element>
		<x:element href="http://www.saxonica.com/documentation/extensions/instructions/entity-ref.html">saxon:entity-ref</x:element>
		<x:element href="http://www.saxonica.com/documentation/extensions/instructions/import-query.html" instruction="no">saxon:import-query</x:element>
		<x:element href="http://www.saxonica.com/documentation/extensions/instructions/iterate.html" instruction="no">saxon:iterate</x:element>
		<x:element href="http://www.saxonica.com/documentation/extensions/instructions/script.html" instruction="no">saxon:script</x:element>
		<x:element href="http://www.saxonica.com/documentation/extensions/instructions/while.html">saxon:while</x:element>
	</x:elements-saxon>
	<x:exslt>
		<x:exsl-date>
			<x:function href="http://www.exslt.org/date/functions/add/index.html">date:add</x:function>
			<x:function href="http://www.exslt.org/date/functions/add-duration/index.html">date:add-duration</x:function>
			<x:function href="http://www.exslt.org/date/functions/date/index.html">date:date</x:function>
			<x:function href="http://www.exslt.org/date/functions/date-time/index.html">date:date-time</x:function>
			<x:function href="http://www.exslt.org/date/functions/day-abbreviation/index.html">date:day-abbreviation</x:function>
			<x:function href="http://www.exslt.org/date/functions/day-in-month/index.html">date:day-in-month</x:function>
			<x:function href="http://www.exslt.org/date/functions/day-in-week/index.html">date:day-in-week</x:function>
			<x:function href="http://www.exslt.org/date/functions/day-in-year/index.html">date:day-in-year</x:function>
			<x:function href="http://www.exslt.org/date/functions/day-name/index.html">date:day-name</x:function>
			<x:function href="http://www.exslt.org/date/functions/day-of-week-in-month/index.html">date:day-of-week-in-month</x:function>
			<x:function href="http://www.exslt.org/date/functions/difference/index.html">date:difference</x:function>
			<x:function href="http://www.exslt.org/date/functions/duration/index.html">date:duration</x:function>
			<x:function href="http://www.exslt.org/date/functions/format-date/index.html">date:format-date</x:function>
			<x:function href="http://www.exslt.org/date/functions/hour-in-day/index.html">date:hour-in-day</x:function>
			<x:function href="http://www.exslt.org/date/functions/leap-year/index.html">date:leap-year</x:function>
			<x:function href="http://www.exslt.org/date/functions/minute-in-hour/index.html">date:minute-in-hour</x:function>
			<x:function href="http://www.exslt.org/date/functions/month-abbreviation/index.html">date:month-abbreviation</x:function>
			<x:function href="http://www.exslt.org/date/functions/month-in-year/index.html">date:month-in-year</x:function>
			<x:function href="http://www.exslt.org/date/functions/month-name/index.html">date:month-name</x:function>
			<x:function href="http://www.exslt.org/date/functions/parse-date/index.html">date:parse-date</x:function>
			<x:function href="http://www.exslt.org/date/functions/second-in-minute/index.html">date:second-in-minute</x:function>
			<x:function href="http://www.exslt.org/date/functions/seconds/index.html">date:seconds</x:function>
			<x:function href="http://www.exslt.org/date/functions/sum/index.html">date:sum</x:function>
			<x:function href="http://www.exslt.org/date/functions/time/index.html">date:time</x:function>
			<x:function href="http://www.exslt.org/date/functions/week-in-month/index.html">date:week-in-month</x:function>
			<x:function href="http://www.exslt.org/date/functions/week-in-year/index.html">date:week-in-year</x:function>
			<x:function href="http://www.exslt.org/date/functions/year/index.html">date:year</x:function>
			<x:element href="http://www.exslt.org/date/elements/date-format/index.html" instruction="no">date:date-format</x:element>
		</x:exsl-date>
		<x:exsl-dyn>
			<x:function href="http://www.exslt.org/dyn/functions/closure/index.html">dyn:closure</x:function>
			<x:function href="http://www.exslt.org/dyn/functions/evaluate/index.html">dyn:evaluate</x:function>
			<x:function href="http://www.exslt.org/dyn/functions/map/index.html">dyn:map</x:function>
			<x:function href="http://www.exslt.org/dyn/functions/max/index.html">dyn:max</x:function>
			<x:function href="http://www.exslt.org/dyn/functions/min/index.html">dyn:min</x:function>
			<x:function href="http://www.exslt.org/dyn/functions/sum/index.html">dyn:sum</x:function>
		</x:exsl-dyn>
		<x:exsl-common>
			<x:function href="http://www.exslt.org/exsl/functions/node-set/index.html">exsl:node-set</x:function>
			<x:function href="http://www.exslt.org/exsl/functions/object-type/index.html">exsl:object-type</x:function>
			<x:element href="http://www.exslt.org/exsl/elements/document/index.html">exsl:document</x:element>
		</x:exsl-common>
		<x:exsl-functions>
			<x:element href="http://www.exslt.org/func/elements/function/index.html" instruction="no">func:function</x:element>
			<x:element href="http://www.exslt.org/func/elements/result/index.html">func:result</x:element>
			<x:element href="http://www.exslt.org/func/elements/script/index.html" instruction="no">func:script</x:element>
		</x:exsl-functions>
		<x:exsl-math>
			<x:function href="http://www.exslt.org/math/functions/abs/index.html">math:abs</x:function>
			<x:function href="http://www.exslt.org/math/functions/acos/index.html">math:acos</x:function>
			<x:function href="http://www.exslt.org/math/functions/asin/index.html">math:asin</x:function>
			<x:function href="http://www.exslt.org/math/functions/atan/index.html">math:atan</x:function>
			<x:function href="http://www.exslt.org/math/functions/atan2/index.html">math:atan2</x:function>
			<x:function href="http://www.exslt.org/math/functions/constant/index.html">math:constant</x:function>
			<x:function href="http://www.exslt.org/math/functions/cos/index.html">math:cos</x:function>
			<x:function href="http://www.exslt.org/math/functions/exp/index.html">math:exp</x:function>
			<x:function href="http://www.exslt.org/math/functions/highest/index.html">math:highest</x:function>
			<x:function href="http://www.exslt.org/math/functions/log/index.html">math:log</x:function>
			<x:function href="http://www.exslt.org/math/functions/lowest/index.html">math:lowest</x:function>
			<x:function href="http://www.exslt.org/math/functions/max/index.html">math:max</x:function>
			<x:function href="http://www.exslt.org/math/functions/min/index.html">math:min</x:function>
			<x:function href="http://www.exslt.org/math/functions/power/index.html">math:power</x:function>
			<x:function href="http://www.exslt.org/math/functions/random/index.html">math:random</x:function>
			<x:function href="http://www.exslt.org/math/functions/sin/index.html">math:sin</x:function>
			<x:function href="http://www.exslt.org/math/functions/sqrt/index.html">math:sqrt</x:function>
			<x:function href="http://www.exslt.org/math/functions/tan/index.html">math:tan</x:function>
		</x:exsl-math>
		<x:exsl-random>
			<x:function href="http://www.exslt.org/random/functions/random-sequence/index.html">random:random-sequence</x:function>
		</x:exsl-random>
		<x:exsl-regexp>
			<x:function href="http://www.exslt.org/regexp/functions/match/index.html">regexp:match</x:function>
			<x:function href="http://www.exslt.org/regexp/functions/replace/index.html">regexp:replace</x:function>
			<x:function href="http://www.exslt.org/regexp/functions/test/index.html">regexp:test</x:function>
		</x:exsl-regexp>
		<x:exsl-set>
			<x:function href="http://www.exslt.org/set/functions/difference/index.html">set:difference</x:function>
			<x:function href="http://www.exslt.org/set/functions/distinct/index.html">set:distinct</x:function>
			<x:function href="http://www.exslt.org/set/functions/has-same-node/index.html">set:has-same-node</x:function>
			<x:function href="http://www.exslt.org/set/functions/intersection/index.html">set:intersection</x:function>
			<x:function href="http://www.exslt.org/set/functions/leading/index.html">set:leading</x:function>
			<x:function href="http://www.exslt.org/set/functions/trailing/index.html">set:trailing</x:function>
		</x:exsl-set>
		<x:exsl-str>
			<x:function href="http://www.exslt.org/str/functions/align/index.html">str:align</x:function>
			<x:function href="http://www.exslt.org/str/functions/concat/index.html">str:concat</x:function>
			<x:function href="http://www.exslt.org/str/functions/decode-uri/index.html">str:decode-uri</x:function>
			<x:function href="http://www.exslt.org/str/functions/encode-uri/index.html">str:encode-uri</x:function>
			<x:function href="http://www.exslt.org/str/functions/padding/index.html">str:padding</x:function>
			<x:function href="http://www.exslt.org/str/functions/replace/index.html">str:replace</x:function>
			<x:function href="http://www.exslt.org/str/functions/split/index.html">str:split</x:function>
			<x:function href="http://www.exslt.org/str/functions/tokenize/index.html">str:tokenize</x:function>
		</x:exsl-str>
	</x:exslt>
	<x:log-of-changes>
		<x:version no="1.1" published="2008-10-23">Section 1 renamed and partly rewritten and link to Florent Georges added.</x:version>
		<x:version no="1.0" published="2008-10-22">First published.</x:version>
	</x:log-of-changes>
</xsl:stylesheet>
