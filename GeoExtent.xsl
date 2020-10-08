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
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>gpm2iso/GeoExtent.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 11, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> matt</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template name="GeoExtent">
        <xsl:element name="gmd:extent">
        <xsl:element name="gmd:EX_Extent">
            <xsl:attribute name="id">boundingExtent</xsl:attribute> 
                <xsl:element name="gmd:geographicElement">
                    <xsl:element name="gmd:EX_GeographicBoundingBox">
                        <xsl:attribute name="id">boundingGeographicBoundingBox</xsl:attribute>
                        <xsl:element name="gmd:westBoundLongitude">
                            <xsl:element name="gco:Decimal"><xsl:value-of select="/GPM/Identification_Information[1]/Spatial_Domain[1]/Bounding_Coordinates/West_Bounding_Coordinate[1]"/></xsl:element>
                        </xsl:element>
                        <xsl:element name="gmd:eastBoundLongitude">
                            <xsl:element name="gco:Decimal"><xsl:value-of select="/GPM/Identification_Information[1]/Spatial_Domain[1]/Bounding_Coordinates/East_Bounding_Coordinate[1]"/></xsl:element>
                        </xsl:element>
                        <xsl:element name="gmd:southBoundLatitude">
                            <xsl:element name="gco:Decimal"><xsl:value-of select="/GPM/Identification_Information[1]/Spatial_Domain[1]/Bounding_Coordinates/South_Bounding_Coordinate[1]"/></xsl:element>
                        </xsl:element>
                        <xsl:element name="gmd:northBoundLatitude">
                            <xsl:element name="gco:Decimal"><xsl:value-of select="/GPM/Identification_Information[1]/Spatial_Domain[1]/Bounding_Coordinates/North_Bounding_Coordinate[1]"/></xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
                 
            <xsl:element name="gmd:temporalElement">
                <xsl:element name="gmd:EX_TemporalExtent">
                    <xsl:attribute name="id">boundingTemporalExtent</xsl:attribute>
                    <xsl:element name="gmd:extent">
                        
                        <xsl:choose>
                            <xsl:when test="/GPM/Identification_Information[1]/Time_Period_of_Content[1]/Range_of_Dates[1]/Beginning_Date[1]">
                                <xsl:element name="gml:TimePeriod">
                                    <xsl:attribute name="gml:id">boundingTemporalExtentABegDateEndDate</xsl:attribute>
                                    <xsl:element name="gml:description"><xsl:value-of select="/GPM/Identification_Information[1]/Time_Period_of_Content[1]/Currentness_Reference[1]"/></xsl:element>
                                    <xsl:element name="gml:beginPosition"><xsl:value-of select="/GPM/Identification_Information[1]/Time_Period_of_Content/Range_of_Dates/Beginning_Date"/></xsl:element>
                                    <xsl:element name="gml:endPosition"><xsl:value-of select="/GPM/Identification_Information[1]/Time_Period_of_Content/Range_of_Dates/Ending_Date[1]"/></xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="/GPM/Identification_Information[1]/Time_Period_of_Content[1]/Calendar_Date[1]">
                                <xsl:element name="gml:TimeInstant">
                                    <xsl:attribute name="gml:id">boundingTemporalExtentASingleDate</xsl:attribute>
                                    <xsl:element name="gml:description"><xsl:value-of select="/GPM/Identification_Information[1]/Time_Period_of_Content[1]/Currentness_Reference[1]"/></xsl:element>
                                    <xsl:element name="gml:timePosition"><xsl:value-of select="/GPM/Identification_Information[1]/Time_Period_of_Content[1]/Calendar_Date[1]"/></xsl:element>
                                </xsl:element>
                            </xsl:when>
                        </xsl:choose>
                        
                    </xsl:element>
                </xsl:element>
            </xsl:element> 
            
        </xsl:element>
        </xsl:element>
    </xsl:template>
    
    
    <xsl:template name="GeoServiceExtent">
        <xsl:element name="srv:extent">
            <xsl:element name="gmd:EX_Extent">
                <xsl:attribute name="id">boundingExtent</xsl:attribute> 
                <xsl:element name="gmd:geographicElement">
                    <xsl:element name="gmd:EX_GeographicBoundingBox">
                        <xsl:attribute name="id">boundingGeographicBoundingBox</xsl:attribute>
                        <xsl:element name="gmd:westBoundLongitude">
                            <xsl:element name="gco:Decimal"><xsl:value-of select="/GPM/Identification_Information[1]/Spatial_Domain[1]/Bounding_Coordinates/West_Bounding_Coordinate[1]"/></xsl:element>
                        </xsl:element>
                        <xsl:element name="gmd:eastBoundLongitude">
                            <xsl:element name="gco:Decimal"><xsl:value-of select="/GPM/Identification_Information[1]/Spatial_Domain[1]/Bounding_Coordinates/East_Bounding_Coordinate[1]"/></xsl:element>
                        </xsl:element>
                        <xsl:element name="gmd:southBoundLatitude">
                            <xsl:element name="gco:Decimal"><xsl:value-of select="/GPM/Identification_Information[1]/Spatial_Domain[1]/Bounding_Coordinates/South_Bounding_Coordinate[1]"/></xsl:element>
                        </xsl:element>
                        <xsl:element name="gmd:northBoundLatitude">
                            <xsl:element name="gco:Decimal"><xsl:value-of select="/GPM/Identification_Information[1]/Spatial_Domain[1]/Bounding_Coordinates/North_Bounding_Coordinate[1]"/></xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
                
                <xsl:element name="gmd:temporalElement">
                    <xsl:element name="gmd:EX_TemporalExtent">
                        <xsl:attribute name="id">boundingTemporalExtent</xsl:attribute>
                        <xsl:element name="gmd:extent">
                            
                            <xsl:choose>
                                <xsl:when test="/GPM/Identification_Information[1]/Time_Period_of_Content[1]/Range_of_Dates[1]/Beginning_Date[1]">
                                    <xsl:element name="gml:TimePeriod">
                                        <xsl:attribute name="gml:id">boundingTemporalExtentABegDateEndDate</xsl:attribute>
                                        <xsl:element name="gml:description"><xsl:value-of select="/GPM/Identification_Information[1]/Time_Period_of_Content[1]/Currentness_Reference[1]"/></xsl:element>
                                        <xsl:element name="gml:beginPosition"><xsl:value-of select="/GPM/Identification_Information[1]/Time_Period_of_Content/Range_of_Dates/Beginning_Date"/></xsl:element>
                                        <xsl:element name="gml:endPosition"><xsl:value-of select="/GPM/Identification_Information[1]/Time_Period_of_Content/Range_of_Dates/Ending_Date[1]"/></xsl:element>
                                    </xsl:element>
                                </xsl:when>
                                <xsl:when test="/GPM/Identification_Information[1]/Time_Period_of_Content[1]/Calendar_Date[1]">
                                    <xsl:element name="gml:TimeInstant">
                                        <xsl:attribute name="gml:id">boundingTemporalExtentASingleDate</xsl:attribute>
                                        <xsl:element name="gml:description"><xsl:value-of select="/GPM/Identification_Information[1]/Time_Period_of_Content[1]/Currentness_Reference[1]"/></xsl:element>
                                        <xsl:element name="gml:timePosition"><xsl:value-of select="/GPM/Identification_Information[1]/Time_Period_of_Content[1]/Calendar_Date[1]"/></xsl:element>
                                    </xsl:element>
                                </xsl:when>
                            </xsl:choose>
                            
                        </xsl:element>
                    </xsl:element>
                </xsl:element> 
                
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
   
    
</xsl:stylesheet>