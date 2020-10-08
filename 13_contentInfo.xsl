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
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>gpm2iso/13_contentInfo.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 12, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template name="gpm2GmdContentInfo">
        <xsl:element name="gmd:contentInfo">
            <xsl:element name="gmd:MD_FeatureCatalogueDescription">
                <xsl:element name="gmd:includedWithDataset">
                    <xsl:element name="gco:Boolean">
                        <xsl:choose>
                            <xsl:when test="GPM/Entity_and_Attribute_Information[1]/Feature_Catologue_Description[1]/Included_With_Dataset">
                                <xsl:variable name="IncWDataset" select="GPM/Entity_and_Attribute_Information[1]/Feature_Catologue_Description[1]/Included_With_Dataset"/>
                                <xsl:choose>
                                    <xsl:when test="contains($IncWDataset,'yes')">true</xsl:when>
                                    <xsl:when test="contains($IncWDataset,'no')">false</xsl:when>
                                <xsl:otherwise>
                                <xsl:value-of select="/GPM/Entity_and_Attribute_Information[1]/Feature_Catologue_Description[1]/Included_With_Dataset[1]"/> 
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:otherwise>true</xsl:otherwise>
                        </xsl:choose>
                        </xsl:element>
                </xsl:element>
                <xsl:element name="gmd:featureTypes">
                    <xsl:element name="gco:LocalName">
                        <xsl:attribute name="codeSpace">unknown</xsl:attribute>
                        <xsl:value-of select="/GPM/Entity_and_Attribute_Information[1]/Feature_Catologue_Description[1]/Feature_Types[1]"/>
                    </xsl:element>
                </xsl:element>
             <!--   <xsl:element name="gmd:featureCatalogueCitation">
                    <xsl:element name="gmd:CI_Citation">
                        <xsl:element name="gmd:title">
                            <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Entity_and_Attribute_Information[1]/Feature_Catologue_Description[1]/FC_Title[1]"/></xsl:element>
                        </xsl:element>
                        <xsl:element name="gmd:date">
                            <xsl:element name="gmd:CI_Date">
                                <xsl:element name="gmd:date">
                                    <xsl:element name="gco:Date">2017</xsl:element>
                                </xsl:element>
                                <xsl:element name="gmd:dateType">
                                    <xsl:element name="gmd:CI_DateTypeCode">
                                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode</xsl:attribute>
                                        <xsl:attribute name="codeListValue">publication</xsl:attribute>publication
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                        
                        
                      
                    </xsl:element>
                    </xsl:element>  -->
                <xsl:call-template name="ContentInfoCit"/>
            </xsl:element>
        </xsl:element>
        
    </xsl:template>
    
    <xsl:template name="ContentInfoCit">
        <xsl:choose>
            <xsl:when test="/GPM/Entity_and_Attribute_Information/Feature_Catalogue_Description">
        <xsl:comment>In the ContentInfoCit Template </xsl:comment>
        <xsl:for-each select="/GPM/Entity_and_Attribute_Information/Feature_Catalogue_Description">
        <xsl:element name="gmd:featureCatalogueCitation">
            <xsl:element name="gmd:CI_Citation">
                <xsl:element name="gmd:title">
                    <xsl:element name="gco:CharacterString"><xsl:value-of select="./FC_Title"/></xsl:element>
                    </xsl:element>
            
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
                <xsl:element name="gmd:otherCitationDetails">
                    <xsl:element name="gco:CharacterString"><xsl:value-of select="./FC_Online_Linkage"/></xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
        </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="gmd:featureCatalogueCitation">
                    <xsl:attribute name="gco:nilReason">missing</xsl:attribute>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
   
    
</xsl:stylesheet>