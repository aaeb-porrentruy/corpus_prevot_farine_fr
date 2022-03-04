<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" encoding="UTF-8"/>
    
    <!-- Script pour extraire les transcriptions avec abrévations développées 
    à partir de Transkribus. 
    
    Attention: ne résout pas le problème du strikeout qui doit être réalisé à la main.-->
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="zone"/>
    
    <xsl:template match="pb">
        <xsl:text>&#xA; &#xA; Page </xsl:text><xsl:value-of select="@n"/>
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>
    
    <xsl:template match="ab">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="lb"/>
    
    <xsl:template match="choice">
        <xsl:value-of select="expan"/>
    </xsl:template>
    
    
    
</xsl:stylesheet>