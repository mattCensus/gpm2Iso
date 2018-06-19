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
    
    <xsl:import href="../gpm2iso/IdentificationCitation.xsl"/>
    <xsl:import href="../gpm2iso/Keywords.xsl"/>
    <xsl:import href="../gpm2iso/Constraints.xsl"/>
    <xsl:import href="../gpm2iso/GeoExtent.xsl"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>gpm2iso/12_identificationInfo.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 9, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template name="gpm2GmdIdentificationInfo">
        <xsl:element name="gmd:identificationInfo">
        <xsl:element name="gmd:MD_DataIdentification">
            <xsl:call-template name="gpm2GmdIdentificationCit"/>
            
            <xsl:element name="gmd:abstract">
                <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Identification_Information[1]/Description[1]/Abstract[1]"/></xsl:element>
            </xsl:element>
            
            <xsl:element name="gmd:purpose">
                <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Identification_Information[1]/Description[1]/Purpose[1]"/></xsl:element>
            </xsl:element>
            
            <xsl:element name="gmd:resourceMaintenance">
                <xsl:element name="gmd:MD_MaintenanceInformation">
                    <xsl:element name="gmd:maintenanceAndUpdateFrequency">
                        <xsl:element name="gmd:MD_MaintenanceFrequencyCode">
                            <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_MaintenanceFrequencyCode</xsl:attribute>
                            <xsl:attribute name="codeListValue"><xsl:value-of select="/GPM/Identification_Information[1]/Status[1]/Maintenance_and_Update_Frequency"/></xsl:attribute>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
         
            
            
            <xsl:if test="/GPM/Identification_Information[1]/Browse_Graphic[1]">
                <xsl:element name="gmd:graphicOverview">
                        <xsl:element name="gmd:MD_BrowseGraphic">
                            <xsl:element name="gmd:fileName">
                                <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Identification_Information[1]/Browse_Graphic[1]"/></xsl:element>
                            </xsl:element>                      
                        <xsl:element name="gmd:fileDescription">
                            <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Identification_Information/Browse_Graphic/Browse_Graphic_File_Description[1]"/></xsl:element>
                        </xsl:element>
                        <xsl:element name="gmd:fileType">
                            <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Identification_Information/Browse_Graphic/Browse_Graphic_File_Type[1]"/></xsl:element>
                        </xsl:element>
                    </xsl:element>
            </xsl:element>
            </xsl:if>
            
           <xsl:call-template name="ISOKeywords"/>
           <xsl:call-template name="ThemeKeywords"/>
           <xsl:call-template name="PlaceKeywords"/>
            <xsl:call-template name="Constraints"/>
            
            <xsl:if test="/GPM/Identification_Information[1]/Cross_Reference[1]">
                <xsl:element name="gmd:aggregationInfo">
                    <xsl:element name="gmd:MD_AggregateInformation">
                        <xsl:element name="gmd:aggregateDataSetName">
                            <xsl:element name="gmd:CI_Citation">
                                <xsl:element name="gmd:title">
                                    <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Identification_Information[1]/Cross_Reference[1]/Title[1]"/></xsl:element>
                                </xsl:element>
                                <xsl:element name="gmd:date">
                                    <xsl:element name="gmd:CI_Date">
                                        <xsl:element name="gmd:date">
                                            <xsl:element name="gco:Date"><xsl:value-of select="/GPM/Identification_Information[1]/Cross_Reference[1]/Citation[1]/Publication_Date[1]"/></xsl:element>
                                        </xsl:element>
                                        <xsl:element name="gmd:dateType">
                                            <xsl:element name="gmd:CI_DateTypeCode">
                                                <xsl:attribute name="codeList">https://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue">publication</xsl:attribute>publication
                                            </xsl:element>
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:element>
                                
                            </xsl:element>
                        </xsl:element>
                        <xsl:element name="gmd:associationType">
                            <xsl:element name="gmd:DS_AssociationTypeCode">
                                <xsl:attribute name="codeList">https://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#DS_AssociationTypeCode</xsl:attribute>
                                <xsl:attribute name="codeListValue">crossReference</xsl:attribute>crossReference
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:if>
            
            <xsl:element name="gmd:spatialRepresentationType">
                <xsl:element name="gmd:MD_SpatialRepresentationTypeCode">
                    <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_SpatialRepresentationTypeCode</xsl:attribute>
                    <xsl:attribute name="codeListValue"><xsl:value-of select="/GPM/Spatial_Data_Organization_Information[1]/Direct_Spatial_Reference_Method[1]"></xsl:value-of></xsl:attribute>
                </xsl:element>
            </xsl:element>
            
            <xsl:choose>
                <xsl:when test="/GPM/Identification_Information[1]/Data_Set_Language[1]">
                    <xsl:element name="gmd:language">
                        <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Identification_Information[1]/Data_Set_Language[1]"/></xsl:element>
                    </xsl:element>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:element name="gmd:language">
                        <xsl:element name="gco:CharacterString">eng</xsl:element>
                    </xsl:element>
                </xsl:otherwise>
            </xsl:choose>
            
            <xsl:choose>
                <xsl:when test="/GPM/Identification_Information[1]/Data_Set_Character_Set[1]">
                    <xsl:element name="gmd:characterSet">
                        <xsl:element name="gmd:MD_CharacterSetCode">
                            <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/GPM/Identification_Information/Data_Set_Character_Set"/></xsl:attribute>
                        <xsl:value-of select="/GPM/Identification_Information/Data_Set_Character_Set"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:element name="gmd:characterSet">
                        <xsl:element name="gmd:MD_CharacterSetCode">
                            <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue">eng</xsl:attribute>eng
                        </xsl:element>
                    </xsl:element>
                </xsl:otherwise>
            </xsl:choose>
            
            <xsl:if test="/GPM/FGDC_Required[1]/ISO_Theme[1]/Theme_Keyword[1]">
            <xsl:element name="gmd:topicCategory">
                <xsl:element name="gmd:MD_TopicCategoryCode"><xsl:value-of select="/GPM/FGDC_Required[1]/ISO_Theme[1]/Theme_Keyword[1]"/></xsl:element>
            </xsl:element>
            </xsl:if>
            
            <xsl:element name="gmd:environmentDescription">
                <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Distribution_Information[1]/Technical_Prerequisites[1]"/></xsl:element>
            </xsl:element>
            <xsl:call-template name="GeoExtent"/>
            
        </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>