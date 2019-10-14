<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/ARQSITS">
        <xsl:for-each select="ARQELEM">
            <xsl:variable name="id" select="position()"/>
            <xsl:result-document href="arqueo/arq{$id}.xml">
                   <xsl:copy-of select="."/>
            </xsl:result-document>
            
        </xsl:for-each>
    </xsl:template>
    
    
</xsl:stylesheet>
