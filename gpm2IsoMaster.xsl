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
    
    <xsl:import href="../gpm2iso/01_gmd_fileIdentifier.xsl"/>
    <xsl:import href="../gpm2iso/02_gmd_language.xsl"/>
    <xsl:import href="../gpm2iso/03_MetadataCharacterSet.xsl"/>
    <xsl:import href="../gpm2iso/04_parentIdentifier.xsl"/>
    <xsl:import href="../gpm2iso/05_hierarchyLevel.xsl"/>
    <xsl:import href="../gpm2iso/06_contact.xsl"/>
    <xsl:import href="../gpm2iso/07_date.xsl"/>
    <xsl:import href="../gpm2iso/08_metadataStandardName.xsl"/>
 
    <xsl:import href="../gpm2iso/09_dataSetURI.xsl"/>
    <xsl:import href="../gpm2iso/10_spatialRepresentationInfo.xsl"/>
    <xsl:import href="../gpm2iso/11_referenceSystemInfo.xsl"/>
    <xsl:import href="../gpm2iso/12_identificationInfo.xsl"/>
    <xsl:import href="../gpm2iso/13_contentInfo.xsl"/>
    <xsl:import href="../gpm2iso/14_distributionInfo.xsl"/>
    <xsl:import href="../gpm2iso/15_dataQualityInfo.xsl"/>
    <xsl:import href="../gpm2iso/16_metadataMaintenance.xsl"/>
    <xsl:import href="../gpm2iso/12A_GPMServices.xsl"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>gpm2iso/gpm2IsoMaster.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 3, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="no" />
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
        <xsl:text>&#10;</xsl:text>
        <xsl:element name="gmi:MI_Metadata">
            
            <!-- inserts the xlinx namspace -->
            <xsl:copy-of select="document('')/*/namespace::*[name()='xlink']"/>
            <!-- inserts the gmd namespace -->
            <xsl:copy-of select="document('')/*/namespace::*[name()='gmd']"/>
            <!-- inserts the gco namespace -->
            <xsl:copy-of select="document('')/*/namespace::*[name()='gco']"/>
            <!-- inserts the gml namespace -->
            <xsl:copy-of select="document('')/*/namespace::*[name()='gml']"/>
            <!-- inserts the xsi namespace -->
            <xsl:copy-of select="document('')/*/namespace::*[name()='xsi']"/>
            <!-- inserts the xmlns="http://www.isotc211.org/2005/gmi namespace -->
            <xsl:copy-of select="document('')/*/namespace::*[name()='gmi']"/>
            <!-- inserts the srv namespace -->
            <xsl:copy-of select="document('')/*/namespace::*[name()='srv']"/>
            
            <xsl:attribute name="xsi:schemaLocation">http://www.isotc211.org/2005/gmi http://www.ngdc.noaa.gov/metadata/published/xsd/schema.xsd</xsl:attribute>
            <xsl:call-template name="gpm2GmdfileIdentifier"/>
            <xsl:call-template name="gpm2Gmdlanguage"/>
            <xsl:call-template name="gpm2GmdMetadataCharacterSet"/>
            
            <xsl:if test="/GPM/Metadata_Reference_Information[1]/Metadata_Parent_Identifier[1]"> 
                <xsl:call-template name="gpm2GmdparentIdentifier"/>
            </xsl:if>
            <xsl:call-template name="gpm2GmdHierarchyLevel"/>
            <xsl:call-template name="gpm2GmdMetContact"/>
            <xsl:call-template name="gpm2GmdMetDate"/>
            <xsl:call-template name="gpm2GmdMetStandardNameVer"/>
            
            <xsl:if test="/GPM/Identification_Information/Citation/Online_Linkage">
                
                <xsl:call-template name="gpm2GmdDataSetURI"/>
            </xsl:if>
          
            <!-- /GPM/Entity_and_Attribute_Information[1] -->
            <xsl:if test="/GPM/Spatial_Data_Organization_Information/SDTS_Terms_Description/SDTS_Point_and_Vector_Object_Type">
                <xsl:call-template name="gpm2GmdSpatialRepresentationInfo"/>
            </xsl:if>
            <xsl:if test="/GPM/Spatial_Data_Organization_Information[1]">
            <xsl:call-template name="gpm2GmdReferenceSystemInfo"/>
            </xsl:if>
            <xsl:if test="/GPM/Spatial_Reference_Information">
               <xsl:call-template name="ProjectionInfo"/>    
            </xsl:if>
            
            <xsl:choose>
                <xsl:when test="/GPM/Computer_Service_Information[1]">
                    <xsl:call-template name="GPMServices"/>
                </xsl:when>
                <xsl:otherwise>
                     <xsl:call-template name="gpm2GmdIdentificationInfo"/>
                </xsl:otherwise>
            </xsl:choose>
           
            
            
            <xsl:if test="/GPM/Entity_and_Attribute_Information[1]">
                <xsl:call-template name="gpm2GmdContentInfo"/>
            </xsl:if>
            <xsl:call-template name="gpm2GmdDistributionInfo"/> 
            <xsl:if test="/GPM/Data_Quality_Information[1]">
             <xsl:call-template name="gpm2GmdDataQualityInfo"/>
            </xsl:if>
            <xsl:call-template name="metadataMaintenance"/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>