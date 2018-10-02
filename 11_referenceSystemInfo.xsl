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
            <xd:p>gpm2iso/11_referenceSystemInfo.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 9, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template name="gpm2GmdReferenceSystemInfo">
        <xsl:element name="gmd:referenceSystemInfo">
            <xsl:element name="gmd:MD_ReferenceSystem">
                <xsl:element name="gmd:referenceSystemIdentifier">
                    <xsl:element name="gmd:RS_Identifier">
                        <xsl:element name="gmd:code">
                            <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Spatial_Data_Organization_Information/Indirect_Spatial_Reference"/></xsl:element>
                        </xsl:element>
                        <xsl:element name="gmd:codeSpace">
                            <xsl:element name="gco:CharacterString">http://www.census.gov/geo/reference/geocodes.html</xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    
    <xsl:template name="ProjectionInfo">
        <xsl:for-each select="/GPM/Spatial_Reference_Information/EPSG_Reference">
        <xsl:element name="gmd:referenceSystemInfo">
            <xsl:element name="gmd:MD_ReferenceSystem">
                <xsl:element name="gmd:referenceSystemIdentifier">
                    <xsl:element name="gmd:RS_Identifier">
                        <xsl:element name="gmd:code">
                            <xsl:element name="gco:CharacterString"><xsl:value-of select="./EPSG_Code"/></xsl:element>
                        </xsl:element>
                        <xsl:element name="gmd:codeSpace">
                            <xsl:element name="gco:CharacterString"><xsl:value-of select="./EPSG_Code_Space[1]"/></xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    
</xsl:stylesheet>