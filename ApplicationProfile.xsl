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
            <xd:p>gpm2iso/ApplicationProfile.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 3, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="no" />
    <xsl:strip-space elements="*"/>
 
 <xsl:template name='protocol'>
     <xsl:param name="NetWorkRes"/>
     <xsl:variable name="protocol" select="substring-before($NetWorkRes,':')"/>
        
     
      <xsl:element name="gmd:protocol">
          <xsl:element name="gco:CharacterString"><xsl:value-of select="$protocol"/></xsl:element>
      </xsl:element>
 </xsl:template>
 
    <xsl:template name="ApplicationProfile">
     
      <!--   <xsl:param name="digitalForm"/> -->
        <xsl:param name="netWorkRes"/>
            <!--  --> <xsl:comment>In the application Profile Template</xsl:comment>
      
        <xsl:variable name="format" select="./Format_Name"/>
        
        <!-- <xsl:comment> format:  <xsl:value-of select="$format"/></xsl:comment>
          <xsl:comment>digital form:  <xsl:value-of select="$digitalForm"/></xsl:comment>
      <xsl:variable name="tigerURL" select="fn:substring-after($digitalForm,'http')"/> -->
        <xsl:choose>
            <xsl:when test="./Network_Address[1]/Application_Profile[1]">
                <xsl:element name="gmd:applicationProfile">
                    <xsl:element name="gco:CharacterString"><xsl:value-of select="./Network_Address[1]/Application_Profile[1]"/></xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:when test="contains($format,'KML')">
                <xsl:element name="gmd:applicationProfile">
                    <xsl:element name="gco:CharacterString">http://opengis.net/spec/kml</xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:when test="contains($format,'WMS')">
                <xsl:element name="gmd:applicationProfile">
                    <xsl:element name="gco:CharacterString">http://opengis.net/spec/wms</xsl:element>
                </xsl:element>
            </xsl:when>
          <!--   --> <xsl:when test="contains($netWorkRes,'tigerweb')">
                <xsl:element name="gmd:applicationProfile">
                    <xsl:element name="gco:CharacterString">http://opengis.net/spec/wms</xsl:element>
                </xsl:element>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>