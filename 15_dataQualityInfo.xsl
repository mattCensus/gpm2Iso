<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xd"
    version="1.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>gpm2iso/15_dataQualityInfo.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 19, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template name="gpm2GmdDataQualityInfo">
        <xsl:element name="gmd:dataQualityInfo">
            <xsl:element name="gmd:DQ_DataQuality">
                
                <xsl:element name="gmd:scope">
                    <xsl:element name="gmd:DQ_Scope">
                        <xsl:element name="gmd:level">
                            <xsl:element name="gmd:MD_ScopeCode">
                                <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_ScopeCode</xsl:attribute>
                                <xsl:element name="codeListValue"><xsl:value-of select="/GPM/Metadata_Reference_Information[1]/Metadata_Hierarchy_Level[1]"/></xsl:element>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
                
                <xsl:if test=""></xsl:if>
                <xsl:if test="/GPM/Data_Quality_Information[1]/Horizontal_Positional_Accuracy_Report">
                    
                    <xsl:element name="gmd:report">
                        
                    </xsl:element>
                </xsl:if>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>