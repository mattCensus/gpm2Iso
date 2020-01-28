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
    xmlns:srv="http://www.isotc211.org/2005/srv"
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
    
    <xsl:template name="GPMServices">
        <xsl:element name="gmd:identificationInfo">
                <xsl:element name="srv:SV_ServiceIdentification">
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
                    
                    <xsl:call-template name="NGDAKeywords"/>
                    <xsl:call-template name="ThemeKeywords"/>
                    <xsl:call-template name="PlaceKeywords"/>
                    <xsl:call-template name="Constraints"/>
                    
                    <xsl:element name="srv:serviceType">
                        <xsl:element name="gco:LocalName"><xsl:value-of select="/GPM/Computer_Service_Information[1]/Service_Type[1]"/></xsl:element>
                    </xsl:element>
                    
                    <xsl:element name="srv:serviceTypeVersion">
                        <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Computer_Service_Information[1]/Service_Type_Version[1]"/></xsl:element>
                    </xsl:element>
                    
                    <xsl:variable name="ServiceType" select="/GPM/Computer_Service_Information[1]/Service_Type[1]"/>
                    
                    <xsl:element name="srv:keywords">
                        <xsl:element name="gmd:MD_Keywords">
                            <xsl:element name="gmd:keyword">
                                <xsl:choose>
                                    <xsl:when test="contains($ServiceType,'WMS')">
                                        <xsl:element name="gco:CharacterString">WMS</xsl:element>
                                    </xsl:when>
                                    <xsl:when test="contains($ServiceType,'WebMapService')">
                                        <xsl:element name="gco:CharacterString">WMS</xsl:element>
                                    </xsl:when>
                                    <xsl:when test="contains($ServiceType,'REST')">
                                        <xsl:element name="gco:CharacterString">REST</xsl:element>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                    
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
                    
                   
                    <xsl:call-template name="GeoServiceExtent"/>
                    
                    <xsl:element name="srv:couplingType">
                        <xsl:element name="srv:SV_CouplingType">
                            <xsl:attribute name="codeList">http://www.isotc211.org/2005/iso19119/resources/Codelist/gmxCodelists.xml#SV_CouplingType</xsl:attribute>
                            <xsl:attribute name="codeListValue"><xsl:value-of select="/GPM/Computer_Service_Information[1]/Coupling_Type[1]"/></xsl:attribute>
                            <xsl:value-of select="/GPM/Computer_Service_Information[1]/Coupling_Type[1]"/>
                        </xsl:element>
                    </xsl:element>
                
            
             <xsl:for-each select="/GPM/Computer_Service_Information/Contains_Operations">
                 <!--  <xsl:comment>Here</xsl:comment>-->
                 <xsl:element name="srv:containsOperations">
                     <xsl:element name="srv:SV_OperationMetadata">
                     
                     <xsl:element name="srv:operationName">
                         <xsl:element name="gco:CharacterString"><xsl:value-of select="./Operation_Name"></xsl:value-of></xsl:element>
                     </xsl:element>
                         
                         <xsl:element name="srv:DCP">
                             <xsl:element name="srv:DCPList">
                                 <xsl:attribute name="codeList">http://www.fgdc.gov/nap/metadata/register/codelists.html#IC_112</xsl:attribute>
                                 <xsl:attribute name="codeListValue"><xsl:value-of select="./DCP[1]"/></xsl:attribute>
                                 <xsl:value-of select="./DCP[1]"/>
                             </xsl:element>
                         </xsl:element>    
                         
                         <xsl:element name="srv:operationDescription">
                             <xsl:element name="gco:CharacterString"><xsl:value-of select="./Operation_Description[1]"></xsl:value-of></xsl:element>
                         </xsl:element>
                         
                         <xsl:for-each select="./Operation_Parameters">
                             <xsl:element name="srv:parameters">
                                 <xsl:element name="srv:SV_Parameter">
                                 <xsl:element name="srv:name">
                                     <xsl:element name="gco:MemberName">
                                         <xsl:element name="gco:aName">
                                         <xsl:element name="gco:CharacterString">
                                             <xsl:value-of select="./Parameter_Name[1]"/>
                                         </xsl:element>
                                             </xsl:element>
                                         <xsl:element name="gco:attributeType"></xsl:element>
                                     </xsl:element>
                                 </xsl:element>
                                 
                                 <xsl:if test="./Parameter_Direction[1]">
                                     <xsl:element name="srv:direction">
                                         <xsl:element name="srv:SV_ParameterDirection"><xsl:value-of select="./Parameter_Direction"/></xsl:element>
                                     </xsl:element>
                                 </xsl:if>
                                     
                                     <xsl:element name="srv:description">
                                         <xsl:element name="gco:CharacterString">
                                             <xsl:value-of select="./Operation_Parameters/Parameter_Description[1]"/>
                                          </xsl:element>
                                     </xsl:element>
                                     
                                    
                                     
                                     <xsl:element name="srv:optionality">
                                         <xsl:element name="gco:CharacterString">Mandatory</xsl:element>
                                     </xsl:element>
                                     
                                     <xsl:element name="srv:repeatability">
                                         <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                                     </xsl:element>
                                     
                                     <xsl:element name="srv:valueType">
                                         <xsl:element name="gco:TypeName">
                                             <xsl:element name="gco:aName">
                                                 <xsl:element name="gco:CharacterString">string</xsl:element>
                                             </xsl:element>
                                         </xsl:element>
                                     </xsl:element>
                                     
                                 </xsl:element>
                             </xsl:element>
                        
                         
                         </xsl:for-each>
                         <xsl:element name="srv:connectPoint">
                             <xsl:element name="gmd:CI_OnlineResource">
                                 <xsl:element name="gmd:linkage">
                                     <xsl:element name="gmd:URL">
                                         <xsl:comment>The URL is contained between the CDATA[ and the first]. Replace &amp; with with the ampersand </xsl:comment>
                                         <xsl:comment>Use an XML editor like Oxygen or a web browser like Firefox to view the metadata</xsl:comment>
                                         <xsl:comment>This operation requires some more paramters. See the WMS specification</xsl:comment>
                                         <xsl:comment>[CDATA[<xsl:value-of select="./Connect_Point[1]"></xsl:value-of></xsl:comment>
                                     </xsl:element>
                                 </xsl:element>
                             </xsl:element>
                         </xsl:element>
                     </xsl:element>
                 </xsl:element>
             </xsl:for-each>
            
                    
                    
                </xsl:element>
            </xsl:element>
    </xsl:template>
</xsl:stylesheet>