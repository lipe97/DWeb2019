<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    
    <xsl:output method="xhtml" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Project Record</title>
                <meta charset="UTF8"/>
            </head>
            <body>
                <h1><center>Project Record</center></h1>
               
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="title">
        <b><font size="5"> Title : </font></b> <xsl:value-of select="."/>
       
    </xsl:template>
    
    <xsl:template match="supervisor">
        <p><b><font size="5"> Supervisor : </font></b> <xsl:value-of select="."/></p>
        
    </xsl:template>
    
    <xsl:template match="bdate">
        <p><b><font size="5"> Bdate : </font></b> <xsl:value-of select="."/></p>
    </xsl:template>
    
    <xsl:template match="edate">
        <p><b><font size="5"> Edate : </font></b> <xsl:value-of select="."/></p>
    </xsl:template>
    
    <xsl:template match="workteam">
        <h3>
            Work Team:
        </h3>
        
        <table border="1">
            <tr>
                <th>Identifier</th><th>Name</th><th>Email</th>
            </tr>
            <xsl:apply-templates/>
        </table>
 
        <xsl:apply-templates select="abstract"/>
    </xsl:template>
    
    <xsl:template match="worker">
        <tr>
            <xsl:apply-templates/>
        </tr>
    </xsl:template>
    
    <xsl:template match="identifier">
        <th>
            <xsl:value-of select="."/>
        </th>
    </xsl:template>
    
    <xsl:template match="name">
        <th>
            <xsl:value-of select="."/>
        </th>
    </xsl:template>
    
    <xsl:template match="email">
        <th>
            <xsl:value-of select="."/>
        </th>
    </xsl:template>
    
 
    
    <xsl:template match="abstract">
        <p><b><font size="5"> Abstract : </font></b></p>
        <xsl:for-each select="p">
            <p> <xsl:value-of select="."/></p>
        </xsl:for-each>

    </xsl:template>
    
    <xsl:template match="deliverables">
       
        <p><b><font size="5"> Deliverables : </font></b></p>
        
        <xsl:for-each select="deliverable">
            <p><a href="{@path}"><xsl:value-of select="."/></a></p>
        </xsl:for-each>
        
        <hr/>
    </xsl:template>
 
</xsl:stylesheet>