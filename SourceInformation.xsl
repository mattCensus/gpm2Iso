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
            <xd:p>../gpm2iso/SourceInformation.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jul 10, 2018</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template name="SourceInformation">
    <xsl:for-each select="/GPM/Data_Quality_Information[1]/Process_Step">
        
        <xsl:element name="gmd:processStep">
            <xsl:element name="LI_ProcessStep">
                <xsl:element name="gmd:description">
                    <xsl:element name="gco:characterString"><xsl:value-of select="."/></xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:for-each>
        
         <xsl:for-each select="/GPM/Data_Quality_Information[1]/Source_Information">
             <xsl:element name="gmd:LI_Source">
                 <xsl:element name="gmd:description">
                     <xsl:element name="gco:CharacterString"><xsl:value-of select="../Source_Contribution"/></xsl:element>
                 </xsl:element>
                 
                 <xsl:element name="gmd:sourceCitation">
                     <xsl:element name="gmd:CI_Citation">
                         
                         <xsl:element name="gmd:title">
                             <xsl:value-of select="../Source_Information/Citation/Title"></xsl:value-of>
                         </xsl:element>
                         
                         <xsl:if test="../Source_Citation_Abbreviation">
                             <xsl:element name="gmd:alternateTitle">
                                 <xsl:element name="gco:CharacterString">
                                     <xsl:value-of select="../Source_Citation_Abbreviation"/>
                                 </xsl:element>
                             </xsl:element>
                         </xsl:if>
                         
                         <xsl:element name="gmd:date">
                             <xsl:element name="gmd:CI_Date">
                                 <xsl:element name="gmd:date">
                                     <xsl:element name="gco:Date"> <xsl:value-of select="../Citation/Publication_Date"/> </xsl:element>
                                 </xsl:element>
                                 <xsl:element name="gmd:dateType">
                                     <xsl:element name="gmd:CI_DateTypeCode">
                                         <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode</xsl:attribute>
                                         <xsl:attribute name="codeListValue"><xsl:value-of select="../Time_Period_of_Content/Currentness_Reference"/></xsl:attribute><xsl:value-of select="../Time_Period_of_Content/Currentness_Reference"/>
                                     </xsl:element>
                                 </xsl:element>
                             </xsl:element>
                         </xsl:element>
                         
                         
                         
                         </xsl:element>
                         
                     </xsl:element>
                 </xsl:element>
                 
            
         </xsl:for-each>
        
    
    </xsl:template>
    
</xsl:stylesheet>