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
    <xsl:import href="../gpm2iso/NGDAWebServices.xsl"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>../gpm2iso/RESTServices.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> July 5, 2018</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>
    
    <!-- take info from ../mrf2ISO/ESRIRestPoint.xsl -->
    <xsl:template name="RestNGDA">
        
        <xsl:variable name="title" select="/GPM/Identification_Information[1]/Citation[1]/Title"/>
        <xsl:variable name="postComma1" select="substring-after($title,',')"/>
        <xsl:variable name="postComma2" select="substring-after($postComma1,',')"/>
        <xsl:variable name="levelOfGeo" select="substring-before($postComma2,',')"/>
        <xsl:variable name="theme" select="substring-after($postComma2,',')"/>
        
        <xsl:comment>Theme:<xsl:value-of select="$theme"/></xsl:comment>
        <xsl:element name="gmd:transferOptions">
            <xsl:element name="gmd:MD_DigitalTransferOptions">
                <xsl:element name="gmd:onLine">
                    <xsl:element name="gmd:CI_OnlineResource">
                        
                        <xsl:element name="gmd:linkage">
                            <xsl:element name="gmd:URL"><xsl:value-of select="/GPM/FGDC_Required[1]/NGDA_Info[1]/REST_URL[1]"/>
                            </xsl:element>
                        </xsl:element>
                        <xsl:call-template name="appProfile"/>
                        
                        <xsl:choose>
                            <xsl:when test="contains($theme,'Current Secondary School Districts')">
                                <xsl:call-template name="SchoolRestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains all the school layers</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="downloadFunction"/>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Consolidated City')">
                                <xsl:call-template name="Places_CouSub_ConCity_SubMCDRestService"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains all the Consolidated Cities layers</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Elementary School Districts')">
                                <xsl:call-template name="SchoolRestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the Elementary School layer</xsl:element>
                                </xsl:element> 
                            </xsl:when>
                            <xsl:when test="contains($theme,'Congressional District')">
                                <xsl:call-template name="LegislativeRestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the 115th Congressional layer</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current American Indian Tribal Subdivision')">
                                <xsl:call-template name="AIANNHARestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains all the Tribal Subdivision and Oklahoma Tribal Statistical Areas layers</xsl:element>
                                </xsl:element>
                            </xsl:when>   
                            <xsl:when test="contains($theme,'AIANNH')">
                                <xsl:call-template name="AIANNHARestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains all the Tribal Subdivision and Oklahoma Tribal Statistical Areas layers</xsl:element>
                                </xsl:element>
                            </xsl:when>   
                            <xsl:when test="contains($theme,'CNECTA')">
                                <xsl:call-template name="CBSARestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the Combined New England City and Town Areas layers</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'CSA')">
                                <xsl:call-template name="CBSARestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the Current Combined Statistical Area (CSA)</xsl:element>
                                </xsl:element>
                            </xsl:when>   
                            <xsl:when test="contains($theme,'Current County and Equivalent')">
                                <xsl:call-template name="State_CountyRestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the Counties and Equivalent Layer</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Metropolitan Division')">
                                <xsl:call-template name="CBSARestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the Current Metropolitan Divisions</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'CBSA')">
                                <xsl:call-template name="CBSARestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the Current Metropolitan Statistical Area/Micropolitan Statistical Area (CBSA) Layers</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'NECTA Division')">
                                <xsl:call-template name="CBSARestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the New England City and Town Area Divisions Layers</xsl:element>     
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'State and Equivalent')">
                                <xsl:call-template name="State_CountyRestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the States and Equivalents Layers</xsl:element>
                                </xsl:element>
                            </xsl:when>   
                            <xsl:when test="contains($theme,'Current Tribal Block Group')">
                                <xsl:call-template name="TribalTractsRestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the Tribal Block Group Layers</xsl:element>
                                </xsl:element>
                            </xsl:when> 
                            <xsl:when test="contains($theme,'Current Tribal Census Tract')">
                                <xsl:call-template name="TribalTractsRestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the Tribal Census Tracts Layers</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'ANRC')">
                                <xsl:call-template name="AIANNHARestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the Alaska Native Regional Corporations Layers</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Census  Urban Area')">
                                <xsl:call-template name="UrbanRestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the 2010 Census Urban Area Clusters</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'ZCTA5')">
                                <xsl:call-template name="PUMA_TAD_TAZ_UGA_ZCTARestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the Zip Code Tabulation Layer</xsl:element>
                                </xsl:element>    
                            </xsl:when>
                            <xsl:when test="contains($theme,'NECTA')">
                                <xsl:call-template name="CBSARestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the Current New England City and Town Area layer</xsl:element>
                                </xsl:element>    
                            </xsl:when>
                            <xsl:when test="contains($theme,'PUMA')">
                                <xsl:call-template name="PUMA_TAD_TAZ_UGA_ZCTARestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the 2010 Public Use Microdata Area layer</xsl:element>
                                </xsl:element>    
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Block Group')">
                                <xsl:call-template name="Tracts_BlocksRestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the 2010 Census Block Groups layer</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Census  Block State-based')">
                                <xsl:call-template name="Tracts_BlocksRestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the 2010 Census Block Groups layer</xsl:element>
                                </xsl:element>    
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Census Tract')">
                                <xsl:call-template name="Tracts_BlocksRestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the 2010 Census Tracts</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            
                            <xsl:when test="contains($theme,'All Roads')">
                                <xsl:call-template name="PhysicalFeaturesRest"/>
                            </xsl:when>    
                            
                            
                        </xsl:choose>
                            <xsl:call-template name="downloadFunction"/>
                            
                        
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
        
       
        
    </xsl:template>
    
    <xsl:template name="appProfile">
            <xsl:element name="gmd:applicationProfile">
                <xsl:element name="gco:CharacterString">http://www.geoplatform.gov/spec/esri-map-rest</xsl:element>
            </xsl:element>
    </xsl:template>
    
    <xsl:template name="PhysicalFeaturesRest">
        <xsl:element name="gmd:name">
            <xsl:element name="gco:CharacterString">TIGERweb/tigerWMS_PhysicalFeatures (MapServer) Rest Service</xsl:element> 
        </xsl:element>
        <xsl:element name="gmd:description">
            <xsl:element name="gco:CharacterString">This Rest Service contains all the Transportation and hydrology layers</xsl:element>
        </xsl:element>
    </xsl:template>
    
    
    <xsl:template name="Places_CouSub_ConCity_SubMCDRestService">
        <xsl:element name="gmd:name">
            <xsl:element name="gco:CharacterString">TIGERweb/Places_CouSub_ConCity_SubMCD (MapServer)</xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="SchoolRestPoint">
        <xsl:element name="gmd:name">
            <xsl:element name="gco:CharacterString">TIGERweb/School (MapServer)</xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="LegislativeRestPoint">
        <xsl:element name="gmd:name">
            <xsl:element name="gco:CharacterString">TIGERweb/Legislative (MapServer)</xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="Tracts_BlocksRestPoint">
        <xsl:element name="gmd:name">
            <xsl:element name="gco:CharacterString">TIGERweb/Tracts_Blocks (MapServer)</xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="PUMA_TAD_TAZ_UGA_ZCTARestPoint">
        <xsl:element name="gmd:name">
            <xsl:element name="gco:CharacterString">TIGERweb/PUMA_TAD_TAZ_UGA_ZCTA (MapServer)</xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="CBSARestPoint">
        <xsl:element name="gmd:name">
            <xsl:element name="gco:CharacterString">TIGERweb/CBSA (MapServer)</xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="UrbanRestPoint">
        <xsl:element name="gmd:name">
            <xsl:element name="gco:CharacterString">TIGERweb/Urban (MapServer)</xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="AIANNHARestPoint">
        <xsl:element name="gmd:name">
            <xsl:element name="gco:CharacterString">TIGERweb/AIANNHA (MapServer)</xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="TribalTractsRestPoint">
        <xsl:element name="gmd:name">
            <xsl:element name="gco:CharacterString">TIGERweb/TribalTracts (MapServer)</xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="State_CountyRestPoint">
        <xsl:element name="gmd:name">
            <xsl:element name="gco:CharacterString">TIGERweb/State_County (MapServer)</xsl:element>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>