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
            <xd:p>gpm2iso/16_metadataMaintenance.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 19, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>
    
    <xsl:template name="metadataMaintenance">
        <xsl:element name="gmd:metadataMaintenance">
            <xsl:element name="gmd:MD_MaintenanceInformation">
                <xsl:element name="gmd:maintenanceAndUpdateFrequency">
                    <xsl:element name="gmd:MD_MaintenanceFrequencyCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_MaintenanceFrequencyCode</xsl:attribute>
                        <xsl:choose>
                            <xsl:when test="/GPM/FGDC_Required/NGDA_Info">
                                <xsl:attribute name="codeListValue">annually</xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                                <!--  <xsl:attribute name="codeListValue">notPlanned</xsl:attribute>-->
                                <xsl:variable name="MaintUpdateFreq" select="/GPM/Identification_Information/Status/Maintenance_and_Update_Frequency"></xsl:variable>
                                <xsl:choose>
                                    <xsl:when test="contains($MaintUpdateFreq,'None planned')">
                                        <xsl:attribute name="codeListValue">annually</xsl:attribute>
                                    </xsl:when>
                                    <xsl:when test="contains($MaintUpdateFreq,'Daily')">
                                        <xsl:attribute name="codeListValue">daily</xsl:attribute>
                                    </xsl:when>
                                    <xsl:when test="contains($MaintUpdateFreq,'Weekly')">
                                        <xsl:attribute name="codeListValue">weekly</xsl:attribute>
                                    </xsl:when>
                                    <xsl:when test="contains($MaintUpdateFreq,'Monthly')">
                                        <xsl:attribute name="codeListValue">monthly</xsl:attribute>
                                    </xsl:when>
                                    <xsl:when test="contains($MaintUpdateFreq,'Annually')">
                                        <xsl:attribute name="codeListValue">annually</xsl:attribute>
                                    </xsl:when>
                                    <xsl:when test="contains($MaintUpdateFreq,'Unknown')">
                                        <xsl:attribute name="codeListValue">unknown</xsl:attribute>
                                    </xsl:when>
                                    <xsl:when test="contains($MaintUpdateFreq,'As needed')">
                                        <xsl:attribute name="codeListValue">asNeeded</xsl:attribute>
                                    </xsl:when>
                                    <xsl:when test="contains($MaintUpdateFreq,'Irregular')">
                                        <xsl:attribute name="codeListValue">irregular</xsl:attribute>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:element>
                </xsl:element>
                
                <xsl:element name="gmd:maintenanceNote">
                    <xsl:element name="gco:CharacterString">This was transformed from the Census Geospatial Product Metadata Content Standard.</xsl:element>
                </xsl:element>
                
                <xsl:if test="/GPM/FGDC_Required">
                    <xsl:element name="gmd:maintenanceNote">
                        <xsl:element name="gco:CharacterString">This dataset is currently a National Gesopatial Data Asset (NGDA) dataset. Next October, this
                            dataset will be edited to remove all the NGDA related tags metadata tags</xsl:element>
                    </xsl:element>
                    
                    <xsl:variable name="MetaCont" select="/GPM/Metadata_Reference_Information/Point_of_Contact/Contact_Organization"/>
                        
                    
                    <xsl:element name="gmd:contact">
                        <xsl:choose>
                            <xsl:when test="contains($MetaCont,'Spatial Data Collection and Products Branch')">
                                <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/B04DFA5D-40CD-B677-E040-0AC8C5BB4473</xsl:attribute>
                                <xsl:attribute name="xlink:title">U.S. Department of Commerce, U.S. Census Bureau, Geography Division, Spatial Data Collection and Products Branch(custodian)</xsl:attribute>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:element>
                </xsl:if>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>