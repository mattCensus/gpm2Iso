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
            <xd:p>gpm2iso/01_gmd_fileIdentifier.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 3, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="no" />
    <xsl:strip-space elements="*"/>
    
    <xsl:template name="gpm2GmdfileIdentifier">
        <xsl:element name="gmd:fileIdentifier">
            <xsl:variable name="mrfFileId" select="/GPM/Metadata_Reference_Information[1]/Metadata_File_Identifier[1]"/>
            <xsl:variable name="preGPP" select="substring-before($mrfFileId,'.gpm')"/>
            <xsl:variable name="Profile" select="/GPM/@profile"/>
            <xsl:choose>
                <xsl:when test="/GPM/Distribution_Information[1]/Standard_Order_Process[1]/Digital_Form[1]/Format_Name[1] ='KML'">
                    <xsl:choose>
                        <xsl:when test="contains($preGPP,'kml')">
                            <xsl:variable name="finalKml" select="concat($preGPP,'.iso.xml')"/>
                            <xsl:element name="gco:CharacterString"><xsl:value-of select="$finalKml"/></xsl:element>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:variable name="finalKml" select="concat($preGPP,'.kml.iso.xml')"/>
                            <xsl:element name="gco:CharacterString"><xsl:value-of select="$finalKml"/></xsl:element>
                        </xsl:otherwise>
                    </xsl:choose>
                    <!--   <xsl:comment>In the KML!!!!!!!!!!!!!</xsl:comment>-->
                    <xsl:text>         
                 </xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <!--<xsl:comment>In the otherwise (shapefile)</xsl:comment>-->
                    <xsl:choose>
                        <xsl:when test="contains($preGPP,'shp')">
                            <xsl:variable name="finalShp" select="concat($preGPP, '.iso.xml')"/>
                            <xsl:element name="gco:CharacterString"><xsl:value-of select="$finalShp"/></xsl:element>
                        </xsl:when>
                        <xsl:when test="contains($Profile,'gdb')">
                            <xsl:variable name="finalShp" select="concat($preGPP, '.gdb.iso.xml')"/>
                            <xsl:element name="gco:CharacterString"><xsl:value-of select="$finalShp"/></xsl:element>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:variable name="finalShp" select="concat($preGPP, '.shp.iso.xml')"/>
                            <xsl:element name="gco:CharacterString"><xsl:value-of select="$finalShp"/></xsl:element>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>