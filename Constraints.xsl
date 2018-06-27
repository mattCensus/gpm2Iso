<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmd="http://www.isotc211.org/2005/gmd"
    xmlns:gmi="http://www.isotc211.org/2005/gmi" xmlns:gmx="http://www.isotc211.org/2005/gmx"
    xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss"
    xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:gfc="http://www.isotc211.org/2005/gfc" xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:grp="http://www.altova.com/Mapforce/grouping"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="fn grp vmf xs xsi xsl xd" xmlns="http://www.isotc211.org/2005/gmi">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>../gpm2iso/Constraints.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 10, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template name="Constraints">
        <xsl:element name="gmd:resourceConstraints">
            
            <xsl:element name="gmd:MD_LegalConstraints">
                
                <xsl:for-each select="/GPM/Identification_Information/Constraints/Access_Constraints">
                <xsl:element name="gmd:accessConstraints">
                    <xsl:element name="gmd:MD_RestrictionCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_RestrictionCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="."/></xsl:attribute>
                    </xsl:element>
                </xsl:element>
                </xsl:for-each>
                <!--  -->
                <xsl:for-each select="/GPM/Identification_Information/Constraints/Use_Constraints">
                <xsl:element name="gmd:useConstraints">
                    <xsl:element name="gmd:MD_RestrictionCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_RestrictionCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="."/></xsl:attribute>
                    </xsl:element>
                </xsl:element>
                </xsl:for-each>
                
                <xsl:for-each select="/GPM/Identification_Information[1]/Constraints[1]/Other_Constraints[1]">
                    <xsl:element name="gmd:otherConstraints">
                        <xsl:element name="gco:CharacterString"><xsl:value-of select="."/></xsl:element>
                    </xsl:element>
                </xsl:for-each>
                
            </xsl:element>
            <!--  -->
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>