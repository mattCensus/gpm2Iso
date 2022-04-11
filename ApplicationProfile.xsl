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
            <!--   <xsl:comment>In the application Profile Template</xsl:comment>-->
      
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
            <xsl:otherwise>
                <xsl:element name="gmd:applicationProfile">
                    <xsl:element name="gco:CharacterString">Subdirectories</xsl:element>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name='name'>
        <xsl:param name="netWorkRes"/>
        <xsl:variable name="filenameA" select="fn:substring-after($netWorkRes,'tiger/')"/>
        <xsl:variable name="finalFileName" select="fn:substring-after($filenameA,'/t')"/>
        <xsl:variable name="finalFileNameB" select="fn:concat('t',$finalFileName)"/>
        <xsl:variable name="fileDesc" select="fn:concat('This zip file contains the',$finalFileNameB,' shapefiile')"/>
        <xsl:variable name="fileDirDes" select="fn:concat('This directory contains files for the ', $finalFileNameB, ' shapefiles' )"/>
        <xsl:variable name="eaFile" select="fn:concat('This directory contains the entity and attribute ', $finalFileNameB, ' shapefiles' )" />
        <xsl:variable name="SeriesCheck" select="/GPM/Identification_Information[1]/Citation[1]/Title[1]"/>
        <xsl:variable name="SeriesCheck2" select="fn:contains($SeriesCheck,'Series Information for the ')"/>
        
        <xsl:choose>
            <xsl:when test="fn:contains($SeriesCheck,'Series Information for the ')">
                <xsl:element name="gmd:name">
                    <!--  <xsl:comment>In the name template for A<xsl:value-of select="$finalFileName"/></xsl:comment>-->
                    <xsl:element name="gco:CharacterString">This is the <xsl:value-of select="$filenameA"/> directory</xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:when test="fn:string-length($finalFileName)>0">
                <xsl:element name="gmd:name">
                   <!--   <xsl:comment>In the name template for A2<xsl:value-of select="$finalFileName"/></xsl:comment>-->
                    <xsl:element name="gco:CharacterString"><xsl:value-of select="$filenameA"/></xsl:element>
                    <xsl:comment><xsl:value-of select="$SeriesCheck2"/></xsl:comment>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="gmd:name">
                    <!--  <xsl:comment>In the name template for B<xsl:value-of select="$netWorkRes"/></xsl:comment>-->
                    <xsl:element name="gco:CharacterString"><xsl:value-of select="$netWorkRes"/></xsl:element>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
        
        <xsl:choose>
            <xsl:when test="./Network_Address/Network_Resource_Description">           
                <xsl:element name="gmd:description">
                   <!--   <xsl:comment>Here 1</xsl:comment>-->
                    <xsl:element name="gco:CharacterString"><xsl:value-of select="./Network_Address[1]/Network_Resource_Description[1]"/></xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:when test="contains($finalFileName,'.zip')">
                <xsl:element name="gmd:description">
                    <!--<xsl:comment>Here 2</xsl:comment> -->
                    <xsl:element name="gco:CharacterString"><xsl:value-of select="$fileDesc"/></xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:when test="contains($finalFileName,'.ea')">
                <xsl:element name="gmd:description">
                    <!--  <xsl:comment>Here 3</xsl:comment> -->
                    <xsl:element name="gco:CharacterString"><xsl:value-of select="$eaFile"/></xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:when test="contains($netWorkRes,'technical')">
                <xsl:element name="gmd:description">
                    <!-- <xsl:comment>Here 4</xsl:comment> -->
                    <xsl:element name="gco:CharacterString">TIGER/Line Shapefiles and TIGER/Line Files Technical Documentation</xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:when test="contains($netWorkRes,'https://www2.census.gov/geo/tiger/')">
                <!-- <xsl:comment>Here 5</xsl:comment> -->
                <xsl:element name="gmd:description">
                    <xsl:element name="gco:CharacterString">Download directory for the <xsl:value-of select="$filenameA"/> files.</xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="gmd:description">
                    <xsl:element name="gco:CharacterString">missing theme Finalfile name: <xsl:value-of select="$finalFileNameB"/> and <xsl:value-of select="$finalFileName"/></xsl:element>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
   <!--  --> <xsl:template name="description">
       <xsl:comment>In the description Template</xsl:comment>
        <xsl:choose>
            <xsl:when test="/GPM/Distribution_Information[1]/Standard_Order_Process[1]/Digital_Form[1]/Network_Address[1]/Network_Resource_Description[1]">
                <xsl:element name="gmd:description">
                    <xsl:element name="gco:CharacterString">
                        <xsl:value-of select="."/>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="gmd:description">
                    <xsl:element name="gco:CharacterString">This is information from the Census Website</xsl:element>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
</xsl:stylesheet>