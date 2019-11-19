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
            <xd:p>gpm2iso/06_contact.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 4, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> matt</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    <!-- U.S. Department of Commerce, U.S. Census Bureau, Geography Division, Geographic Products Branch 
        Cartographic Products Branch
        Spatial Data Collection and Products Branch
     -->
    <xsl:variable name="MetOrg" select="/GPM/Metadata_Reference_Information[1]/Point_of_Contact[1]/Contact_Organization[1]"/>
    <xsl:variable name="DistOrg" select="/GPM/Distribution_Information[1]/Distributor[1]/Contact_Organization[1]"/>
    
   
    <xsl:template name="gpm2GmdMetContact">
      <!--    <xsl:comment>MetOrg: <xsl:value-of select="$MetOrg"/></xsl:comment>
        <xsl:comment>DistOrg<xsl:value-of select="$DistOrg"/> </xsl:comment>-->
        <xsl:choose>
            <xsl:when test="/GPM/Metadata_Reference_Information/Point_of_Contact/Contact_Address">
                <xsl:element name="gmd:contact">
                    <!-- <xsl:comment>Calling the responiible party</xsl:comment> -->
                    <xsl:call-template name="CI_ResponsiblePartyMRI"/>
                    
                </xsl:element>
            </xsl:when>
            <xsl:when test="contains($MetOrg,'Geographic Products Branch')">
                <xsl:call-template name="GeoProductsBranchPOC"/>
            </xsl:when>
            <xsl:when test="contains($MetOrg,'Cartographic Products Branch')">
                <!-- <xsl:comment>in the cartographic branch></xsl:comment> -->
                <xsl:call-template name="GeoCartProdPoc"/>
            </xsl:when>
            <xsl:when test="contains($MetOrg,'Spatial Products Software')">
                <xsl:call-template name="GeoSpatProdBranchPOC"/>
            </xsl:when>
            <xsl:when test="contains($MetOrg,'U.S. Census Bureau')">
                 <xsl:call-template name="GeoDivPoc"/>
            </xsl:when>
            <xsl:when test="contains($MetOrg,'Spatial Data Collection and Products Branch')">
                <xsl:call-template name="GeoSpatProdBranchPOC"/>
            </xsl:when>
            <xsl:otherwise>
             <!--   <xsl:comment> In the otherwise!!!!!!!!!!!!!</xsl:comment>--> 
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <xsl:template name="gpm2GmdDisContact">
        <!--  <xsl:comment>MetOrg: <xsl:value-of select="$MetOrg"/></xsl:comment>-->
        <xsl:choose>
            <xsl:when test="/GPM/Distribution_Information/Point_of_Contact/Contact_Address">
                <xsl:element name="gmd:distributorContact">
                    <xsl:call-template name="CI_ResponsiblePartyDist"/>
                </xsl:element>
            </xsl:when>
            <xsl:when test="contains($DistOrg,'Geographic Products Branch')">
                <xsl:call-template name="GeoProductsBranchDPOC"/>
            </xsl:when>
            <xsl:when test="contains($DistOrg,'Cartographic Products Branch')">
                <!-- <xsl:comment>in the cartographic branch></xsl:comment> -->
                <xsl:call-template name="GeoCartProdDPoc"/>
            </xsl:when>
            <xsl:when test="contains($DistOrg,'Spatial Products Software')">
                <xsl:call-template name="GeoSpatProdBranchDPOC"/>
            </xsl:when>
            <xsl:when test="contains($DistOrg,'U.S. Census Bureau')">
                <xsl:call-template name="GeoDivDPoc"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="gmd:distributorContact">
                    <xsl:call-template name="CI_ResponsiblePartyDist"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- Geographic Products Branc  gmd:distributorContact-->
    <xsl:template name="GeoProductsBranchPOC">
        <xsl:element name="gmd:contact">
            <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/B04DFA5D-40CD-B677-E040-0AC8C5BB4473</xsl:attribute>
            <xsl:attribute name="xlink:title">U.S. Department of Commerce, U.S. Census Bureau, Geography Division, Geographic Products Branch (Point of Contact)</xsl:attribute>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="GeoProductsBranchDPOC">
        <xsl:element name="gmd:distributorContact">
            <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/B04DFA5D-40CD-B677-E040-0AC8C5BB4473</xsl:attribute>
            <xsl:attribute name="xlink:title">U.S. Department of Commerce, U.S. Census Bureau, Geography Division, Geographic Products Branch (Point of Contact)</xsl:attribute>
        </xsl:element>
    </xsl:template>
    
  
    <xsl:template name="GeoProductsBranchCitRepParty">
        <xsl:element name="gmd:citedResponsibleParty">
            <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/B04DFA5D-40CD-B677-E040-0AC8C5BB4473</xsl:attribute>
            <xsl:attribute name="xlink:title">U.S. Department of Commerce, U.S. Census Bureau, Geography Division, Geographic Products Branch (Cited Responsibility)</xsl:attribute>
        </xsl:element>
    </xsl:template>
    
     <!--  Cartographic Products Branch -->
    <xsl:template name="GeoCartProdPoc">
        <xsl:element name="gmd:contact">
            <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/8dd6ee96-96e1-492c-be55-76cdde8f27f1</xsl:attribute>
            <xsl:attribute name="xlink:title">U.S. Department of Commerce, U.S. Census Bureau, Geography Division/Cartographic Products Branch (Point of Contact)</xsl:attribute>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="GeoCartProdDPoc">
        <xsl:element name="gmd:distributorContact">
            <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/8dd6ee96-96e1-492c-be55-76cdde8f27f1</xsl:attribute>
            <xsl:attribute name="xlink:title">U.S. Department of Commerce, U.S. Census Bureau, Geography Division/Cartographic Products Branch (Point of Contact)</xsl:attribute>
        </xsl:element>
    </xsl:template>
   
    <xsl:template name="GeoCartProdCitRepParty">
        <xsl:element name="gmd:citedResponsibleParty">
            <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/8dd6ee96-96e1-492c-be55-76cdde8f27f1</xsl:attribute>
            <xsl:attribute name="xlink:title">U.S. Department of Commerce, U.S. Census Bureau, Geography Division/Cartographic Products Branch (Cited Responsibility)</xsl:attribute>
        </xsl:element>
    </xsl:template>
    
    <!-- Spatial Products Software Branch -->
    
    <xsl:template name="GeoSpatProdBranchPOC">
        <xsl:element name="gmd:contact">
            <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/a3ade798-946f-4d45-9dc9-b8e9a5d9866b </xsl:attribute>
            <xsl:attribute name="xlink:title">originator - U.S. Department of Commerce, U.S. Census Bureau, Geography Division, Spatial Data Collection and Products Branch</xsl:attribute>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="GeoSpatProdBranchDPOC">
        <xsl:element name="gmd:distributorContact">
            <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/a3ade798-946f-4d45-9dc9-b8e9a5d9866b </xsl:attribute>
            <xsl:attribute name="xlink:title">originator - U.S. Department of Commerce, U.S. Census Bureau, Geography Division, Spatial Products Software Branch</xsl:attribute>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="GeoSpatProdBranchCitRepParty">
        <xsl:element name="gmd:citedResponsibleParty">
            <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/a3ade798-946f-4d45-9dc9-b8e9a5d9866b </xsl:attribute>
            <xsl:attribute name="xlink:title">originator - U.S. Department of Commerce, U.S. Census Bureau, Geography Division, Spatial Products Software Branch</xsl:attribute>
        </xsl:element>
    </xsl:template>
    
    <!-- Geography Division -->
    <xsl:template name="GeoDivPoc">
        <xsl:element name="gmd:contact">
            <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/186104a8-278b-412d-9b61-d4d488142f3c</xsl:attribute>
            <xsl:attribute name="xlink:title">U.S. Department of Commerce, U.S. Census Bureau, Geography Division (Point of Contact)</xsl:attribute>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="GeoDivDPoc">
        <xsl:element name="gmd:distributorContact">
            <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/186104a8-278b-412d-9b61-d4d488142f3c</xsl:attribute>
            <xsl:attribute name="xlink:title">U.S. Department of Commerce, U.S. Census Bureau, Geography Division (Point of Contact)</xsl:attribute>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="GeoDivCitRepParty">
        <xsl:element name="gmd:citedResponsibleParty">
            <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/186104a8-278b-412d-9b61-d4d488142f3c</xsl:attribute>
            <xsl:attribute name="xlink:title">U.S. Department of Commerce, U.S. Census Bureau, Geography Division (Point of Contact)</xsl:attribute>
        </xsl:element>
    </xsl:template>
    
    <!-- address contact templates -->
    
    <xsl:template name="CI_ResponsiblePartyMRI">
        <xsl:element name="gmd:CI_ResponsibleParty">
            <xsl:if test="/GPM/Metadata_Reference_Information[1]/Point_of_Contact[1]/Contact_Individual[1]">
                <xsl:element name="gmd:individualName">
                    <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Metadata_Reference_Information[1]/Point_of_Contact[1]/Contact_Individual[1]"/></xsl:element>
                </xsl:element>
            </xsl:if>
            <xsl:element name="gmd:organisationName">
                <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Metadata_Reference_Information[1]/Point_of_Contact[1]/Contact_Organization[1]"/></xsl:element>
            </xsl:element>
            <xsl:element name="gmd:contactInfo">
                <xsl:element name="gmd:CI_Contact">
                    
                    <xsl:element name="gmd:phone">
                        <xsl:element name="gmd:CI_Telephone">                                        
                            <xsl:element name="gmd:voice">
                                <xsl:choose>
                                    <xsl:when test="/GPM/Metadata_Reference_Information[1]/Point_of_Contact[1]/Contact_Voice_Telephone[1]">
                                        <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Metadata_Reference_Information[1]/Point_of_Contact[1]/Contact_Voice_Telephone[1]"/></xsl:element>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:element name="gco:CharacterString">301-763-1128</xsl:element>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:element>
                            <xsl:choose>
                                <xsl:when test="/GPM/Metadata_Reference_Information[1]/Point_of_Contact[1]/Contact_Fax[1]">
                                    <xsl:element name="gmd:facsimile">
                                        <xsl:element name="gco:CharacterString">
                                            <xsl:value-of select="/GPM/Metadata_Reference_Information[1]/Point_of_Contact[1]/Contact_Fax[1]"/>
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:when>
                                <xsl:when test="contains($MetOrg,'U.S. Census Bureau')">
                                     <xsl:element name="gmd:facsimile">
                                    <xsl:element name="gco:CharacterString">301-763-4710</xsl:element>
                                </xsl:element>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:element>
                    </xsl:element>
                    
                   
                    
                    
                    <xsl:element name="gmd:address">
                        <xsl:element name="gmd:CI_Address">
                            
                            <xsl:element name="gmd:deliveryPoint">
                                <xsl:choose>
                                    <xsl:when test="/GPM/Metadata_Reference_Information[1]/Point_of_Contact/Contact_Address/Address">
                                        <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Metadata_Reference_Information[1]/Point_of_Contact[1]/Contact_Address[1]/Address[1]"/></xsl:element>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:element name="gco:CharacterString">4600 Silver Hill Road, Stop 7400</xsl:element>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:element>
                            
                            <xsl:element name="gmd:city">
                                <xsl:choose>
                                    <xsl:when test="/GPM/Metadata_Reference_Information[1]/Point_of_Contact[1]/Contact_Address[1]/City[1]">
                                        <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Metadata_Reference_Information[1]/Point_of_Contact[1]/Contact_Address[1]/City[1]"/></xsl:element>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:element name="gco:CharacterString">Washington</xsl:element>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:element>
                            
                            <xsl:element name="gmd:administrativeArea">
                                <xsl:choose>
                                    <xsl:when test="/GPM/Metadata_Reference_Information[1]/Point_of_Contact[1]/Contact_Address[1]/State_or_Province[1]">
                                       <!-- <xsl:comment>in the state</xsl:comment> --> 
                                        <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Metadata_Reference_Information[1]/Point_of_Contact[1]/Contact_Address[1]/State_or_Province[1]"/></xsl:element>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:element name="gco:CharacterString">DC</xsl:element>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:element>
                            
                            <xsl:element name="gmd:postalCode">
                                <xsl:choose>
                                    <xsl:when test="/GPM/Metadata_Reference_Information[1]/Point_of_Contact[1]/Contact_Address[1]/Postal_Code[1]">
                                        <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Metadata_Reference_Information[1]/Point_of_Contact[1]/Contact_Address[1]/Postal_Code[1]"/></xsl:element>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:element name="gco:CharacterString">20233-7400</xsl:element>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:element>
                            
                            <xsl:element name="gmd:country">
                                <xsl:choose>
                                    <xsl:when test="/GPM/Metadata_Reference_Information[1]/Point_of_Contact[1]/Contact_Address[1]/Country[1]">
                                        <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Metadata_Reference_Information[1]/Point_of_Contact[1]/Contact_Address[1]/Country[1]"/></xsl:element>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:element name="gco:CharacterString">United States</xsl:element>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:element>
                            
                            <xsl:element name="gmd:electronicMailAddress">
                                <xsl:choose>
                                    <xsl:when test="/GPM/Metadata_Reference_Information[1]/Point_of_Contact[1]/Contact_Electronic_Mail_Address[1]">
                                        <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Metadata_Reference_Information[1]/Point_of_Contact[1]/Contact_Electronic_Mail_Address[1]"/></xsl:element>
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
            <!-- <xsl:comment>Pre role choice</xsl:comment> -->
            <xsl:choose>
                <xsl:when test="/GPM/Metadata_Reference_Information[1]/Point_of_Contact[1]/Role[1]">
                    <xsl:element name="gmd:role">
                    <xsl:element name="gmd:CI_RoleCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_RoleCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/GPM/Metadata_Reference_Information[1]/Point_of_Contact[1]/Role[1]"/></xsl:attribute>
                    </xsl:element>
                    </xsl:element>
                </xsl:when>
           <xsl:otherwise>
            <xsl:element name="gmd:role">
                <xsl:element name="gmd:CI_RoleCode">
                    <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_RoleCode</xsl:attribute>
                    <xsl:attribute name="codeListValue">custodian</xsl:attribute>custodian
                </xsl:element>
            </xsl:element>
           </xsl:otherwise>
             </xsl:choose>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="CI_ResponsiblePartyDist">
        <xsl:element name="gmd:CI_ResponsibleParty">
            <xsl:element name="gmd:organisationName">
                <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Distribution_Information[1]/Point_of_Contact[1]/Contact_Organization[1]"/></xsl:element>
            </xsl:element>
            <xsl:element name="gmd:contactInfo">
                <xsl:element name="gmd:CI_Contact">
                    
                    <xsl:element name="gmd:phone">
                        <xsl:element name="gmd:CI_Telephone">                                        
                            <xsl:element name="gmd:voice">
                                <xsl:choose>
                                    <xsl:when test="/GPM/Distribution_Information[1]/Point_of_Contact[1]/Contact_Voice_Telephone[1]">
                                        <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Distribution_Information[1]/Point_of_Contact[1]/Contact_Voice_Telephone[1]"/></xsl:element>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:element name="gco:CharacterString">301-763-1128</xsl:element>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:element>
                            <xsl:if test="contains($MetOrg,'U.S. Census Bureau')">
                                <xsl:element name="gmd:facsimile">
                                    <xsl:element name="gco:CharacterString">301-763-4710</xsl:element>
                                </xsl:element>
                            </xsl:if>
                        </xsl:element>
                    </xsl:element>
                    
                    <xsl:element name="gmd:address">
                        <xsl:element name="gmd:CI_Address">
                            
                            <xsl:element name="gmd:deliveryPoint">
                                <xsl:choose>
                                    <xsl:when test="/GPM/Distribution_Information[1]/Point_of_Contact[1]/Contact_Address[1]/Address[1]">
                                        <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Distribution_Information[1]/Point_of_Contact[1]/Contact_Address[1]/Address[1]"/></xsl:element>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:element name="gco:CharacterString">4600 Silver Hill Road, Stop 7400</xsl:element>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:element>
                            
                            <xsl:element name="gmd:city">
                                <xsl:choose>
                                    <xsl:when test="/GPM/Distribution_Information[1]/Contact_Address[1]/City[1]">
                                        <xsl:element name="gco:CharacterString"><xsl:value-of select="//GPM/Distribution_Information[1]/Point_of_Contact[1]/Contact_Address[1]/City[1]"/></xsl:element>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:element name="gco:CharacterString">Washington</xsl:element>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:element>
                            
                            <xsl:element name="gmd:administrativeArea">
                                <xsl:choose>
                                    <xsl:when test="/GPM/Distribution_Information[1]/Contact_Address[1]/State_or_Province[1]">
                                        <!-- <xsl:comment>in the state</xsl:comment> --> 
                                        <xsl:element name="gco:CharacterString"><xsl:value-of select="//GPM/Distribution_Information[1]/Contact_Address[1]/State_or_Province[1]"/></xsl:element>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:element name="gco:CharacterString">DC</xsl:element>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:element>
                            
                            <xsl:element name="gmd:postalCode">
                                <xsl:choose>
                                    <xsl:when test="/GPM/Distribution_Information[1]/Point_of_Contact[1]/Contact_Address[1]/Postal_Code[1]">
                                        <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Distribution_Information[1]/Point_of_Contact[1]/Contact_Address[1]/Postal_Code[1]"/></xsl:element>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:element name="gco:CharacterString">20233-7400</xsl:element>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:element>
                            
                            <xsl:element name="gmd:country">
                                <xsl:choose>
                                    <xsl:when test="/GPM/Distribution_Information[1]/Point_of_Contact[1]/Contact_Address[1]/Country[1]">
                                        <xsl:element name="gco:CharacterString"><xsl:value-of select="//GPM/Distribution_Information[1]/Point_of_Contact[1]/Contact_Address[1]/Country[1]"/></xsl:element>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:element name="gco:CharacterString">United States</xsl:element>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:element>
                            
                            <xsl:element name="gmd:electronicMailAddress">
                                <xsl:choose>
                                    <xsl:when test="/GPM/Distribution_Information[1]/Point_of_Contact[1]/Contact_Electronic_Mail_Address[1]">
                                        <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Distribution_Information[1]/Point_of_Contact[1]/Contact_Electronic_Mail_Address[1]"/></xsl:element>
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
           <!--  <xsl:comment>Pre role choice</xsl:comment>--> 
            <xsl:choose>
                <xsl:when test="/GPM/Distribution_Information[1]/Point_of_Contact[1]/Role[1]">
                    <xsl:element name="gmd:role">
                        <xsl:element name="gmd:CI_RoleCode">
                            <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_RoleCode</xsl:attribute>
                            <xsl:attribute name="codeListValue"><xsl:value-of select="/GPM/Distribution_Information[1]/Point_of_Contact[1]/Role[1]"/></xsl:attribute>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:element name="gmd:role">
                        <xsl:element name="gmd:CI_RoleCode">
                            <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_RoleCode</xsl:attribute>
                            <xsl:attribute name="codeListValue">distributor</xsl:attribute>custodian
                        </xsl:element>
                    </xsl:element>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>
    
    
</xsl:stylesheet>