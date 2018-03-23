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
    
    <xsl:import href="../gpm2iso/06_contact.xsl"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>gpm2iso/IdentificationCitation.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 9, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template name="gpm2GmdIdentificationCit">
        <xsl:element name="gmd:citation">
            <xsl:element name="gmd:CI_Citation">
                <xsl:element name="gmd:title">
                    <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Identification_Information/Citation/Title"/></xsl:element>
                </xsl:element>
                <xsl:if test="/GPM/Identification_Information[1]/Citation[1]/Alternate_Title[1]">
                    <xsl:element name="gmd:alternateTitle">
                        <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Identification_Information/Citation/Alternate_Title[1]"/></xsl:element>
                    </xsl:element>
                </xsl:if>
                <xsl:element name="gmd:date">
                    <xsl:element name="gmd:CI_Date">
                        <xsl:comment>This is the publication date</xsl:comment>
                        <xsl:element name="gmd:date">
                            <xsl:element name="gco:Date"><xsl:value-of select="/GPM/Identification_Information/Citation/Publication_Date"/></xsl:element>
                        </xsl:element>
                        
                        <xsl:element name="gmd:dateType">
                            <xsl:element name="gmd:CI_DateTypeCode">
                                <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode</xsl:attribute>
                                <xsl:attribute name="codeListValue">publication</xsl:attribute>publication
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
                
                <xsl:if test="/GPM/Identification_Information/Citation/Edition">
                    <xsl:element name="gmd:edition">
                        <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Identification_Information/Citation/Edition"/></xsl:element>
                    </xsl:element>
                </xsl:if>
                   
                  
                 <xsl:call-template name="gpm2GmdCitResParty"/>
                
                <xsl:element name="gmd:presentationForm">
                    <xsl:element name="gmd:CI_PresentationFormCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_PresentationFormCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/GPM/Identification_Information[1]/Citation[1]/Geospatial_Data_Presentation_Form[1]"></xsl:value-of></xsl:attribute>
                    </xsl:element>
                </xsl:element>
                
                
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="gpm2GmdCitResParty">
        <xsl:choose>
            <xsl:when test="/GPM/Identification_Information[1]/Point_of_Contact[1]/Contact_Address[1]">
                <xsl:element name="gmd:citedResponsibleParty">
                    <xsl:element name="gmd:CI_ResponsibleParty">
                        <xsl:element name="gmd:organisationName">
                            <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Identification_Information/Point_of_Contact/Contact_Organization"/></xsl:element>
                        </xsl:element>
                        <xsl:element name="gmd:contactInfo">
                            <xsl:element name="gmd:CI_Contact">
                                
                                <xsl:element name="gmd:phone">
                                    <xsl:element name="gmd:CI_Telephone">                                        
                                        <xsl:element name="gmd:voice">
                                            <xsl:choose>
                                                <xsl:when test="/GPM/Metadata_Reference_Information[1]/Metadata_Contact[1]/Contact_Voice_Telephone">
                                                    <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Metadata_Reference_Information[1]/Metadata_Contact[1]/Contact_Voice_Telephone"/></xsl:element>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:element name="gco:CharacterString">301-763-1128</xsl:element>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:element>
                                        <xsl:element name="gmd:facsimile">
                                            <xsl:element name="gco:CharacterString">301-763-4710</xsl:element>
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:element>
                                
                                <xsl:element name="gmd:address">
                                    <xsl:element name="gmd:CI_Address">
                                        
                                        <xsl:element name="gmd:deliveryPoint">
                                            <xsl:choose>
                                                <xsl:when test="/GPM/Metadata_Reference_Information/Metadata_Contact/Contact_Address/Address">
                                                    <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Metadata_Reference_Information/Metadata_Contact/Contact_Address/Address"/></xsl:element>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:element name="gco:CharacterString">4600 Silver Hill Road, Stop 7400</xsl:element>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:element>
                                        
                                        <xsl:element name="gmd:city">
                                            <xsl:choose>
                                                <xsl:when test="/GPM/Metadata_Reference_Information[1]/Metadata_Contact[1]/Contact_Address[1]/City[1]">
                                                    <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Metadata_Reference_Information[1]/Metadata_Contact[1]/Contact_Address[1]/City[1]"/></xsl:element>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:element name="gco:CharacterString">Washington</xsl:element>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:element>
                                        
                                        <xsl:element name="gmd:administrativeArea">
                                            <xsl:choose>
                                                <xsl:when test="/GPM/Metadata_Reference_Information[1]/Metadata_Contact[1]/Contact_Address[1]/State_or_Province[1]">
                                                    <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Metadata_Reference_Information/Metadata_Contact/Contact_Address/State_or_Province"/></xsl:element>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:element name="gco:CharacterString">DC</xsl:element>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:element>
                                        
                                        <xsl:element name="gmd:postalCode">
                                            <xsl:choose>
                                                <xsl:when test="/GPM/Metadata_Reference_Information[1]/Metadata_Contact[1]/Contact_Address[1]/Postal_Code[1]">
                                                    <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Metadata_Reference_Information[1]/Metadata_Contact[1]/Contact_Address[1]/Postal_Code[1]"/></xsl:element>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:element name="gco:CharacterString">20233-7400</xsl:element>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:element>
                                        
                                        <xsl:element name="gmd:country">
                                            <xsl:choose>
                                                <xsl:when test="/GPM/Metadata_Reference_Information/Metadata_Contact/Contact_Address/Country">
                                                    <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Metadata_Reference_Information/Metadata_Contact/Contact_Address/Country"/></xsl:element>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:element name="gco:CharacterString">United States</xsl:element>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:element>
                                        
                                        <xsl:element name="gmd:electronicMailAddress">
                                            <xsl:choose>
                                                <xsl:when test="/GPM/Metadata_Reference_Information[1]/Metadata_Contact[1]/Contact_Electronic_Mail_Address[1]">
                                                    <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Metadata_Reference_Information[1]/Metadata_Contact[1]/Contact_Electronic_Mail_Address[1]"/></xsl:element>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:element name="gco:CharacterString">geo.geography@census.gov</xsl:element>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:element>
                                        
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                        
                        <xsl:element name="gmd:role">
                            <xsl:element name="gmd:CI_RoleCode">
                                <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_RoleCode</xsl:attribute>
                                <xsl:attribute name="codeListValue">custodian</xsl:attribute>custodian
                            </xsl:element>
                        </xsl:element>
                        
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:when test="contains($MetOrg,'Geographic Products Branch')">
                <xsl:call-template name="GeoProductsBranchCitRepParty"/>
            </xsl:when>
            <xsl:when test="contains($MetOrg,'Cartographic Products Branch')">
                <!-- <xsl:comment>in the cartographic branch></xsl:comment> -->
                <xsl:call-template name="GeoCartProdCitRepParty"/>
            </xsl:when>
            <xsl:when test="contains($MetOrg,'Spatial Products Software')">
                <xsl:call-template name="GeoSpatProdBranchCitRepParty"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="GeoDivCitRepParty"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>