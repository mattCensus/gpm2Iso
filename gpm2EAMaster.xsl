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
            <xd:p><xd:b>Created on:</xd:b> Sep 7, 2018</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="no" />
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">

        <xsl:element name="gfc:FC_FeatureCatalogue">
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
            <!-- inserts the gmx namespace -->
            <xsl:copy-of select="document('')/*/namespace::*[name()='gmx']"></xsl:copy-of>

            <xsl:element name="gmx:name">
                <xsl:element name="gco:CharacterString">
                    <xsl:value-of select="/GPM/Entity_and_Attribute_Information/Feature_Catalogue_Description/FC_Title"/>
                </xsl:element>
            </xsl:element>
            
            <xsl:element name="gmx:scope">
                <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Entity_and_Attribute_Information/Feature_Catalogue_Description/Feature_Types"/></xsl:element>
            </xsl:element>
            
            <xsl:choose>
                <xsl:when test="/GPM/Identification_Information/Citation/Edition">
                    <xsl:element name="gmx:versionNumber">
                        <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Identification_Information/Citation/Edition"/></xsl:element>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="/GPM/Identification_Information/Citation/Publication_Date">
                    <xsl:element name="gmx:versionNumber">
                        <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Identification_Information/Citation/Publication_Date"/></xsl:element>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="/GPM/Entity_and_Attribute_Information/Feature_Catalogue_Description/Version">
                    <xsl:element name="gmx:versionNumber">
                        <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Entity_and_Attribute_Information[1]/Feature_Catalogue_Description[1]/Version[1]"/></xsl:element>
                    </xsl:element>
                </xsl:when>
            </xsl:choose>
            
            
            <xsl:element name="gmx:versionDate">
                <xsl:element name="gco:Date"> <xsl:value-of select="/GPM/Metadata_Reference_Information/Metadata_Date"/> </xsl:element>
            </xsl:element>
            
            <xsl:element name="gmx:language">
                <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Metadata_Reference_Information[1]/Metadata_Language[1]"/></xsl:element>
            </xsl:element>
            
            <xsl:element name="gmx:characterSet">
                <xsl:element name="gmd:MD_CharacterSetCode">
                    <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                    <xsl:attribute name="codeListValue"><xsl:value-of select="/GPM/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                    <xsl:value-of select="/GPM/Metadata_Reference_Information/Metadata_Character_Set"/>
                </xsl:element>
            </xsl:element>
            
            <xsl:element name="gfc:producer">
                <xsl:call-template name="CI_ResponsiblePartyMRI"/>
            </xsl:element>
            
            <xsl:element name="gfc:featureType">
                <xsl:element name="gfc:FC_FeatureType">
                    
                    <xsl:element name="gfc:typeName">
                        <xsl:element name="gco:LocalName"><xsl:value-of select="/GPM/Entity_and_Attribute_Information/Detailed_Description/Entity_Type/Entity_Type_Label"/></xsl:element>
                    </xsl:element>
                    
                    <xsl:element name="gfc:definition">
                        <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Entity_and_Attribute_Information/Detailed_Description/Entity_Type/Entity_Type_Definition"/></xsl:element>
                    </xsl:element>
                    
                    <xsl:element name="gfc:isAbstract">
                        <xsl:element name="gco:Boolean">false</xsl:element>
                    </xsl:element>
                    
                    <xsl:element name="gfc:featureCatalogue">
                        <xsl:variable name="file" select="/GPM/Metadata_Reference_Information[1]/Metadata_File_Identifier[1]"/>
                        <xsl:variable name="editionA" select="substring-before($file,'.')"/>
                        <xsl:variable name="FinalEdition" select="concat($editionA,'.ea.iso.xml')"/>
                        <xsl:attribute name="uuidref"> <xsl:value-of select="$FinalEdition"></xsl:value-of></xsl:attribute>
                    </xsl:element>
                    
                    <xsl:for-each select="/GPM/Entity_and_Attribute_Information/Detailed_Description/Attribute">
                        <xsl:element name="gfc:carrierOfCharacteristics">
                            <xsl:element name="gfc:FC_FeatureAttribute">
                                
                                <xsl:element name="gfc:memberName">
                                    <xsl:element name="gco:LocalName"><xsl:value-of select="./Attribute_Label"/></xsl:element>
                                </xsl:element>
                                
                                <xsl:element name="gfc:definition">
                                    <xsl:element name="gco:CharacterString"><xsl:value-of select="./Attribute_Definition"/></xsl:element>
                                </xsl:element>
                                
                                <xsl:element name="gfc:cardinality">
                                    <xsl:choose>
                                        <xsl:when test="./Attribute_Domain_Values/Range_Domain">
                                            <xsl:for-each select="./Attribute_Domain_Values/Range_Domain">
                                                <xsl:element name="gco:Multiplicity">
                                                    <xsl:element name="gco:range">
                                                        <xsl:element name="gco:MultiplicityRange">
                                                            
                                                            <xsl:element name="gco:lower">
                                                                <xsl:element name="gco:Integer"><xsl:value-of select="./Range_Domain_Minimum"/></xsl:element>
                                                            </xsl:element>
                                                            
                                                            <xsl:element name="gco:upper">
                                                                <xsl:variable name="Upper" select="./Range_Domain_Maximum"/>
                                                                <xsl:variable name="UnLinInt" select="translate($Upper,',','')"></xsl:variable>
                                                                <xsl:element name="gco:UnlimitedInteger"><xsl:value-of select="$UnLinInt"/></xsl:element>
                                                            </xsl:element>
                                                            
                                                        </xsl:element>
                                                    </xsl:element>
                                                </xsl:element>
                                            </xsl:for-each>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    
                                </xsl:element>
                                
                                <xsl:variable name="DefRef" select="./Attribute_Definition_Source"/>
                               <!--  <xsl:comment>DefRef:<xsl:value-of select="$DefRef"/></xsl:comment> -->
                                <xsl:choose>
                                    <xsl:when test="contains($DefRef,'Census')">
                                       <!--   <xsl:comment>Census!!!!!!!!!!!!!!!!!</xsl:comment>-->
                                        <xsl:element name="gfc:definitionReference">
                                            <xsl:attribute name="xlink:title">U.S Census Bureau</xsl:attribute>
                                            <xsl:attribute name="xlink:href">http://www.ngdc.noaa.gov/docucomp/eb139e38-ee29-4d59-b157-5e874d4420c4</xsl:attribute>
                                        </xsl:element>
                                    </xsl:when>
                                    <xsl:when test="contains($DefRef,'U.S. Postal Service')">
                                        <xsl:element name="gfc:definitionReference">
                                            <xsl:attribute name="xlink:title">U.S. Postal Service</xsl:attribute>
                                            <xsl:attribute name="xlink:href">http://www.ngdc.noaa.gov/docucomp/2de06071-f4d0-49b7-bd93-ba7a38e5d911 </xsl:attribute>
                                        </xsl:element>
                                    </xsl:when>
                                    <xsl:when test="contains($DefRef,'USPS')">
                                        <xsl:element name="gfc:definitionReference">
                                            <xsl:attribute name="xlink:title">U.S. Postal Service</xsl:attribute>
                                            <xsl:attribute name="xlink:href">http://www.ngdc.noaa.gov/docucomp/2de06071-f4d0-49b7-bd93-ba7a38e5d911 </xsl:attribute>
                                        </xsl:element>
                                    </xsl:when>
                                    <xsl:when test="contains($DefRef,'Office of Management and Budget')">
                                        <xsl:element name="gfc:definitionReference">
                                            <xsl:attribute name="xlink:title">Office of Management and Budget (OMB)</xsl:attribute>
                                            <xsl:attribute name="xlink:href">>http://www.ngdc.noaa.gov/docucomp/5c2bfb61-0530-4cf8-8f46-5ee07a2accb9</xsl:attribute>
                                        </xsl:element>
                                    </xsl:when>
                                    <xsl:when test="contains($DefRef,'OMB')">
                                        <xsl:element name="gfc:definitionReference">
                                            <xsl:attribute name="xlink:title">Office of Management and Budget (OMB)</xsl:attribute>
                                            <xsl:attribute name="xlink:href">>http://www.ngdc.noaa.gov/docucomp/5c2bfb61-0530-4cf8-8f46-5ee07a2accb9</xsl:attribute>
                                        </xsl:element>
                                    </xsl:when>
                                    <xsl:when test="contains($DefRef, 'United States Geological Survey')">
                                        <xsl:element name="gfc:definitionReference">
                                            <xsl:attribute name="xlink:title">United States Geological Survey (USGS)</xsl:attribute>
                                            <xsl:attribute name="xlink:href">>http://www.ngdc.noaa.gov/docucomp/8d0b86d3-09b4-4fc4-8e8e-2922517fe12d </xsl:attribute>
                                        </xsl:element>
                                    </xsl:when>
                                    <xsl:when test="contains($DefRef, 'USGS')">
                                        <xsl:element name="gfc:definitionReference">
                                            <xsl:attribute name="xlink:title">United States Geological Survey (USGS)</xsl:attribute>
                                            <xsl:attribute name="xlink:href">http://www.ngdc.noaa.gov/docucomp/8d0b86d3-09b4-4fc4-8e8e-2922517fe12d </xsl:attribute>
                                        </xsl:element>
                                    </xsl:when>
                                   <xsl:otherwise>
                                      <!--   <xsl:comment>In the otherwise!!!!!!!!!!</xsl:comment>-->
                                       <xsl:element name="gfc:definitionReference">
                                           <xsl:element name="gfc:FC_DefinitionReference">
                                               <xsl:element name="gfc:definitionSource">
                                           <xsl:element name="gfc:FC_DefinitionSource">
                                               <xsl:element name="gfc:source">
                                               <xsl:element name="gmd:CI_Citation">
                                               
                                                   <xsl:element name="gmd:title">
                                                       <xsl:element name="gco:CharacterString"><xsl:value-of select="./Attribute_Definition_Source"/></xsl:element>
                                                   </xsl:element>
                                                  
                                                   <xsl:element name="gmd:date">                                                     
                                                       <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                                                   </xsl:element>
                                               </xsl:element>
                                               </xsl:element>
                                           </xsl:element>
                                                   
                                           </xsl:element>
                                           </xsl:element>
                                           
                                       </xsl:element>
                                   </xsl:otherwise>
                                </xsl:choose>
                                
                                <xsl:for-each select="./Attribute_Domain_Values/Enumerated_Domain">
                                    <xsl:element name="gfc:listedValue">
                                        <xsl:element name="gfc:FC_ListedValue">
                                            
                                            <xsl:element name="gfc:label">
                                                <xsl:element name="gco:CharacterString"><xsl:value-of select="./Enumerated_Domain_Value"/></xsl:element>
                                            </xsl:element>
                                            
                                            <xsl:element name="gfc:definition">
                                                <xsl:element name="gco:CharacterString"><xsl:value-of select="./Enumerated_Domain_Value_Definition"/></xsl:element>
                                            </xsl:element>
                                            
                                            <xsl:variable name="DomValueRef" select="./Enumerated_Domain_Value_Definition_Source"></xsl:variable>
                                           
                                                <xsl:choose>
                                                    <xsl:when test="contains($DomValueRef,'Census')">
                                                        <!--   <xsl:comment>Census!!!!!!!!!!!!!!!!!</xsl:comment>-->
                                                        <xsl:element name="gfc:definitionReference">
                                                            <xsl:attribute name="xlink:title">U.S Census Bureau</xsl:attribute>
                                                            <xsl:attribute name="xlink:href">http://www.ngdc.noaa.gov/docucomp/eb139e38-ee29-4d59-b157-5e874d4420c4</xsl:attribute>
                                                        </xsl:element>
                                                    </xsl:when>
                                                    <xsl:when test="contains($DomValueRef,'U.S. Postal Service')">
                                                        <xsl:element name="gfc:definitionReference">
                                                            <xsl:attribute name="xlink:title">U.S. Postal Service</xsl:attribute>
                                                            <xsl:attribute name="xlink:href">http://www.ngdc.noaa.gov/docucomp/2de06071-f4d0-49b7-bd93-ba7a38e5d911 </xsl:attribute>
                                                        </xsl:element>
                                                    </xsl:when>
                                                    <xsl:when test="contains($DomValueRef,'USPS')">
                                                        <xsl:element name="gfc:definitionReference">
                                                            <xsl:attribute name="xlink:title">U.S. Postal Service</xsl:attribute>
                                                            <xsl:attribute name="xlink:href">http://www.ngdc.noaa.gov/docucomp/2de06071-f4d0-49b7-bd93-ba7a38e5d911 </xsl:attribute>
                                                        </xsl:element>
                                                    </xsl:when>
                                                    <xsl:when test="contains($DomValueRef,'Office of Management and Budget')">
                                                        <xsl:element name="gfc:definitionReference">
                                                            <xsl:attribute name="xlink:title">Office of Management and Budget (OMB)</xsl:attribute>
                                                            <xsl:attribute name="xlink:href">>http://www.ngdc.noaa.gov/docucomp/5c2bfb61-0530-4cf8-8f46-5ee07a2accb9</xsl:attribute>
                                                        </xsl:element>
                                                    </xsl:when>
                                                    <xsl:when test="contains($DomValueRef,'OMB')">
                                                        <xsl:element name="gfc:definitionReference">
                                                            <xsl:attribute name="xlink:title">Office of Management and Budget (OMB)</xsl:attribute>
                                                            <xsl:attribute name="xlink:href">>http://www.ngdc.noaa.gov/docucomp/5c2bfb61-0530-4cf8-8f46-5ee07a2accb9</xsl:attribute>
                                                        </xsl:element>
                                                    </xsl:when>
                                                    <xsl:when test="contains($DomValueRef, 'United States Geological Survey')">
                                                        <xsl:element name="gfc:definitionReference">
                                                            <xsl:attribute name="xlink:title">United States Geological Survey (USGS)</xsl:attribute>
                                                            <xsl:attribute name="xlink:href">>http://www.ngdc.noaa.gov/docucomp/8d0b86d3-09b4-4fc4-8e8e-2922517fe12d </xsl:attribute>
                                                        </xsl:element>
                                                    </xsl:when>
                                                    <xsl:when test="contains($DomValueRef, 'USGS')">
                                                        <xsl:element name="gfc:definitionReference">
                                                            <xsl:attribute name="xlink:title">United States Geological Survey (USGS)</xsl:attribute>
                                                            <xsl:attribute name="xlink:href">http://www.ngdc.noaa.gov/docucomp/8d0b86d3-09b4-4fc4-8e8e-2922517fe12d </xsl:attribute>
                                                        </xsl:element>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                       <!--   <xsl:comment>In the otherwise!!!!!!!!!!</xsl:comment>-->
                                                        <xsl:element name="gfc:definitionReference">
                                                            <xsl:element name="gfc:FC_DefinitionReference">
                                                                <xsl:element name="gfc:definitionSource">
                                                                    <xsl:element name="gfc:FC_DefinitionSource">
                                                                        <xsl:element name="gfc:source">
                                                                            <xsl:element name="gmd:CI_Citation">
                                                                                
                                                                                <xsl:element name="gmd:title">
                                                                                    <xsl:element name="gco:CharacterString"><xsl:value-of select="./Enumerated_Domain_Value_Definition_Source"/></xsl:element>
                                                                                </xsl:element>
                                                                                
                                                                                <xsl:element name="gmd:date">                                                     
                                                                                    <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                                                                                </xsl:element>
                                                                            </xsl:element>
                                                                        </xsl:element>
                                                                    </xsl:element>
                                                                    
                                                                </xsl:element>
                                                            </xsl:element>
                                                            
                                                        </xsl:element>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            
                                            
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:for-each>
                                
                                <xsl:for-each select="./Attribute_Domain_Values/Unrepresentable_Domain">
                                    <xsl:element name="gfc:listedValue">
                                        <xsl:element name="gfc:FC_ListedValue">
                                    <xsl:element name="gfc:label">
                                        <xsl:attribute name="gco:nilReason">inapplicable</xsl:attribute>
                                    </xsl:element>
                                    
                                    <xsl:element name="gfc:definition">
                                        <xsl:element name="gco:CharacterString"><xsl:value-of select="."/></xsl:element>
                                    </xsl:element>
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:for-each>
                                
                                <xsl:for-each select="./Attribute_Domain_Values/Codeset_Domain">
                                    <xsl:element name="gfc:listedValue">
                                        <xsl:element name="gfc:FC_ListedValue">
                                            
                                            <xsl:element name="gfc:label">
                                                <xsl:element name="gco:CharacterString"><xsl:value-of select="./Codeset_Name"/></xsl:element>
                                            </xsl:element>
                                            
                                            <xsl:variable name="CodesetRef" select="./Codeset_Source"></xsl:variable>
                                            
                                            <xsl:choose>
                                                <xsl:when test="contains($CodesetRef,'Census')">
                                                    <!--   <xsl:comment>Census!!!!!!!!!!!!!!!!!</xsl:comment>-->
                                                    <xsl:element name="gfc:definitionReference">
                                                        <xsl:attribute name="xlink:title">U.S Census Bureau</xsl:attribute>
                                                        <xsl:attribute name="xlink:href">http://www.ngdc.noaa.gov/docucomp/eb139e38-ee29-4d59-b157-5e874d4420c4</xsl:attribute>
                                                    </xsl:element>
                                                </xsl:when>
                                                <xsl:when test="contains($CodesetRef,'U.S. Postal Service')">
                                                    <xsl:element name="gfc:definitionReference">
                                                        <xsl:attribute name="xlink:title">U.S. Postal Service</xsl:attribute>
                                                        <xsl:attribute name="xlink:href">http://www.ngdc.noaa.gov/docucomp/2de06071-f4d0-49b7-bd93-ba7a38e5d911 </xsl:attribute>
                                                    </xsl:element>
                                                </xsl:when>
                                                <xsl:when test="contains($CodesetRef,'USPS')">
                                                    <xsl:element name="gfc:definitionReference">
                                                        <xsl:attribute name="xlink:title">U.S. Postal Service</xsl:attribute>
                                                        <xsl:attribute name="xlink:href">http://www.ngdc.noaa.gov/docucomp/2de06071-f4d0-49b7-bd93-ba7a38e5d911 </xsl:attribute>
                                                    </xsl:element>
                                                </xsl:when>
                                                <xsl:when test="contains($CodesetRef,'Office of Management and Budget')">
                                                    <xsl:element name="gfc:definitionReference">
                                                        <xsl:attribute name="xlink:title">Office of Management and Budget (OMB)</xsl:attribute>
                                                        <xsl:attribute name="xlink:href">>http://www.ngdc.noaa.gov/docucomp/5c2bfb61-0530-4cf8-8f46-5ee07a2accb9</xsl:attribute>
                                                    </xsl:element>
                                                </xsl:when>
                                                <xsl:when test="contains($CodesetRef,'OMB')">
                                                    <xsl:element name="gfc:definitionReference">
                                                        <xsl:attribute name="xlink:title">Office of Management and Budget (OMB)</xsl:attribute>
                                                        <xsl:attribute name="xlink:href">>http://www.ngdc.noaa.gov/docucomp/5c2bfb61-0530-4cf8-8f46-5ee07a2accb9</xsl:attribute>
                                                    </xsl:element>
                                                </xsl:when>
                                                <xsl:when test="contains($CodesetRef, 'United States Geological Survey')">
                                                    <xsl:element name="gfc:definitionReference">
                                                        <xsl:attribute name="xlink:title">United States Geological Survey (USGS)</xsl:attribute>
                                                        <xsl:attribute name="xlink:href">>http://www.ngdc.noaa.gov/docucomp/8d0b86d3-09b4-4fc4-8e8e-2922517fe12d </xsl:attribute>
                                                    </xsl:element>
                                                </xsl:when>
                                                <xsl:when test="contains($CodesetRef, 'USGS')">
                                                    <xsl:element name="gfc:definitionReference">
                                                        <xsl:attribute name="xlink:title">United States Geological Survey (USGS)</xsl:attribute>
                                                        <xsl:attribute name="xlink:href">http://www.ngdc.noaa.gov/docucomp/8d0b86d3-09b4-4fc4-8e8e-2922517fe12d </xsl:attribute>
                                                    </xsl:element>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <!--   <xsl:comment>In the otherwise!!!!!!!!!!</xsl:comment>-->
                                                    <xsl:element name="gfc:definitionReference">
                                                        <xsl:element name="gfc:FC_DefinitionReference">
                                                            <xsl:element name="gfc:definitionSource">
                                                                <xsl:element name="gfc:FC_DefinitionSource">
                                                                    <xsl:element name="gfc:source">
                                                                        <xsl:element name="gmd:CI_Citation">
                                                                            
                                                                            <xsl:element name="gmd:title">
                                                                                <xsl:element name="gco:CharacterString"><xsl:value-of select="./Codeset_Source"/></xsl:element>
                                                                            </xsl:element>
                                                                            
                                                                            <xsl:element name="gmd:date">                                                     
                                                                                <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                                                                            </xsl:element>
                                                                        </xsl:element>
                                                                    </xsl:element>
                                                                </xsl:element>
                                                                
                                                            </xsl:element>
                                                        </xsl:element>
                                                        
                                                    </xsl:element>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                            
                                        </xsl:element>
                                    </xsl:element>
                                    
                                </xsl:for-each>
                                
                                
                            </xsl:element>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    

</xsl:stylesheet>