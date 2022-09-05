<xsl:stylesheet  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:alto="http://www.loc.gov/standards/alto/ns-v4#"
    xpath-default-namespace="http://www.loc.gov/standards/alto/ns-v4#" version="2.0"
    exclude-result-prefixes="xs alto">
    <xsl:output encoding="UTF-8" method="xml" indent="yes" 
        omit-xml-declaration="yes"/>
   
    <xsl:template match="@*|node()">
        
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="sourceImageInformation">
            <xsl:apply-templates/>
            
            <!-- Creating a variable with a information similar in booth documents *.jpeg -->
            <xsl:variable name="filename">
                <xsl:value-of select="//fileName"/>
            </xsl:variable>
    
            <!-- Creating a variable for the information to copy -->
            <xsl:variable name="cote">
                <xsl:copy-of select= "document('recolement.xml')/root/row[Heading0=$filename]/Heading2"/>    
            </xsl:variable>

            <documentIdentifier>
                <xsl:value-of select="$cote"/>
            </documentIdentifier>
                 
    </xsl:template>    
    
</xsl:stylesheet>