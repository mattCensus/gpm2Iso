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
            <xd:p>gpm2iso/05_hierarchyLevel.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 3, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template name="gpm2GmdHierarchyLevel">
        <xsl:variable name="Title" select="/GPM/Identification_Information[1]/Citation[1]/Title[1]"/>
        <xsl:choose>
            <xsl:when test="/GPM/Metadata_Reference_Information[1]/Metadata_Hierarchy_Level[1]">
        
        <xsl:element name="gmd:hierarchyLevel">
            <xsl:element name="gmd:MD_ScopeCode">
                <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_ScopeCode</xsl:attribute>
                <xsl:attribute name="codeListValue"><xsl:value-of select="/GPM/Metadata_Reference_Information[1]/Metadata_Hierarchy_Level[1]"/></xsl:attribute>
                <xsl:value-of select="/GPM/Metadata_Reference_Information[1]/Metadata_Hierarchy_Level[1]"/>
            </xsl:element>
        </xsl:element>
            </xsl:when>
            <xsl:when test="contains($Title,'Series Information File')">
                <xsl:element name="gmd:hierarchyLevel">
                <xsl:element name="gmd:MD_ScopeCode">
                    <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_ScopeCode</xsl:attribute>
                    <xsl:attribute name="codeListValue">series</xsl:attribute>
                    series
                </xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:when test="contains($Title,'TIGERweb')">
                <xsl:element name="gmd:hierarchyLevel">
                <xsl:element name="gmd:MD_ScopeCode">
                    <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_ScopeCode</xsl:attribute>
                    <xsl:attribute name="codeListValue">service</xsl:attribute>
                    service
                </xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:when test="contains($Title,'REST Service')">
                <xsl:element name="gmd:hierarchyLevel">
                <xsl:element name="gmd:MD_ScopeCode">
                    <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_ScopeCode</xsl:attribute>
                    <xsl:attribute name="codeListValue">service</xsl:attribute>
                    service
                </xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:when test="contains($Title,'Map')">
                <xsl:element name="gmd:hierarchyLevel">
                <xsl:element name="gmd:MD_ScopeCode">
                    <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_ScopeCode</xsl:attribute>
                    <xsl:attribute name="codeListValue">mapDocument</xsl:attribute>
                    mapDocument
                </xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:when test="contains($Title,'Planned')">
                <xsl:element name="gmd:hierarchyLevel">
                <xsl:element name="gmd:MD_ScopeCode">
                    <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_ScopeCode</xsl:attribute>
                    <xsl:attribute name="codeListValue">initiative</xsl:attribute>
                   initiative
                </xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="gmd:hierarchyLevel">
                    <xsl:element name="gmd:MD_ScopeCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_ScopeCode</xsl:attribute>
                        <xsl:attribute name="codeListValue">dataset</xsl:attribute>
                       dataset
                    </xsl:element>
                </xsl:element>
                
            </xsl:otherwise>
           
        </xsl:choose>
        
        <xsl:if test="/GPM/Metadata_Reference_Information/Metadata_Hierarchy_Level_Name">
             <xsl:element name="gmd:hierarchyLevelName">
                 <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Metadata_Reference_Information/Metadata_Hierarchy_Level_Name"/></xsl:element>
             </xsl:element> 
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>