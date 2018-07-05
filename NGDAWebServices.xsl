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
            <xd:p>gpm2iso/NGDAWebServices</xd:p>
            <xd:p><xd:b>Created on:</xd:b> July 5, 2018</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>

    <xsl:template name="WMSNGDA">
        <xsl:if test="/GPM/FGDC_Required[1]/NGDA_Info[1]/GETMAP_URL[1]">
            <xsl:variable name="GetMap" select="/GPM/FGDC_Required[1]/NGDA_Info[1]/GETMAP_URL"/>
            
            <xsl:variable name="Title" select="/GPM/Identification_Information[1]/Citation[1]/Title[1]"/>
             <xsl:variable name="PostComma1" select="substring-after($Title,',')"/>
             <xsl:variable name="year" select="substring-before($PostComma1,',')"/>
            <xsl:variable name="PostComma2" select="substring-after($PostComma1,',')"/>
            <xsl:variable name="PostComma3" select="substring-after($PostComma2,',')"/>
            <xsl:variable name="Theme" select="substring-after($PostComma3,',')"/>
            
            <xsl:variable name="part1">This web mapping service contains the layer for the </xsl:variable>
            <xsl:variable name="part2">This URL is to be used in mapping software like ArcMap. To use this in a web browser, see the OGC Web Mapping Specification.
            </xsl:variable>
            <xsl:variable name="Desc" select="concat($part1,$year,$Theme,$part2)"/>
            
            <xsl:element name="gmd:transferOptions">
                <xsl:element name="gmd:MD_DigitalTransferOptions">
                    <xsl:element name="gmd:onLine">
                        <xsl:element name="gmd:CI_OnlineResource">

                            <xsl:element name="gmd:linkage">
                                <xsl:element name="gmd:URL">
                                    <xsl:value-of select="/GPM/FGDC_Required[1]/NGDA_Info[1]/GETMAP_URL[1]"/>
                                </xsl:element>
                            </xsl:element>
                            <xsl:element name="gmd:applicationProfile">
                                <xsl:element name="gco:CharacterString">http://opengis.net/spec/wms</xsl:element>
                            </xsl:element>
                            <xsl:element name="gmd:name">
                                <xsl:choose>
                                    <xsl:when test="contains($GetMap,'PhysicalFeatures')">
                                        <xsl:element name="gco:CharacterString">TIGERweb/tigerWMS_PhysicalFeatures (MapServer)</xsl:element>
                                    </xsl:when>
                                    <xsl:when test="contains($GetMap,'Current')">
                                        <xsl:element name="gco:CharacterString">TIGERweb/tigerWMS_Current (MapServer)</xsl:element>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:element>
                            
                            <xsl:element name="gmd:description">
                                <xsl:element name="gco:CharacterString"><xsl:value-of select="$Desc"/>
                                </xsl:element>
                            </xsl:element>
                                
                            <xsl:call-template name="downloadFunction"/>

                            
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:if>

    </xsl:template>



<xsl:template name="downloadFunction">
    <xsl:element name="gmd:function">
        <xsl:element name="gmd:CI_OnLineFunctionCode">
            <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_OnlineFunctionCode</xsl:attribute>
            <xsl:attribute name="codeListValue">download</xsl:attribute>download
        </xsl:element>
    </xsl:element>
</xsl:template>
</xsl:stylesheet>
