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
            <xd:p>../gpm2iso/SourceInformation.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jul 10, 2018</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>

    <xsl:template name="SourceInformation">
        <xsl:element name="gmd:lineage">
            <xsl:element name="gmd:LI_Lineage">
                <xsl:for-each select="/GPM/Data_Quality_Information[1]/Process_Step">

                    <xsl:element name="gmd:processStep">
                        <xsl:element name="gmd:LI_ProcessStep">
                            <xsl:element name="gmd:description">
                                <xsl:element name="gco:CharacterString">
                                    <xsl:value-of select="."/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>

                </xsl:for-each>

                <xsl:for-each select="/GPM/Data_Quality_Information[1]/Source_Information">
                    <xsl:element name="gmd:source">
                        <xsl:element name="gmd:LI_Source">
                            <xsl:element name="gmd:description">
                                <xsl:element name="gco:CharacterString">
                                    <xsl:value-of select="./Source_Contribution"/>
                                </xsl:element>
                            </xsl:element>

                            <xsl:element name="gmd:sourceCitation">
                                <xsl:element name="gmd:CI_Citation">

                                    <xsl:element name="gmd:title">
                                        <xsl:element name="gco:CharacterString">
                                            <xsl:value-of select="./Citation/Title"/>
                                        </xsl:element>
                                    </xsl:element>

                                    <xsl:if test="./Source_Citation_Abbreviation">
                                        <xsl:element name="gmd:alternateTitle">
                                            <xsl:element name="gco:CharacterString">
                                                <xsl:value-of select="./Source_Citation_Abbreviation"/>
                                            </xsl:element>
                                        </xsl:element>
                                    </xsl:if>

                                    <xsl:element name="gmd:date">
                                        <xsl:element name="gmd:CI_Date">
                                            <xsl:variable name="DateType" select="./Citation/Publication_Date"/>
                                            <xsl:element name="gmd:date">

                                                <xsl:choose>
                                                    <xsl:when test="contains($DateType,'unknown')">
                                                        <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                                                    </xsl:when>
                                                  <!--   <xsl:otherwise>
                                             <xsl:element name="gco:Date"> <xsl:value-of select="./Citation/Publication_Date"/> </xsl:element>
                                             </xsl:otherwise>-->
                                                    <xsl:otherwise>
                                                        <xsl:element name="gco:Date">
                                                            <xsl:value-of select="./Citation/Publication_Date"/>
                                                        </xsl:element>
                                                    </xsl:otherwise>
                                                </xsl:choose>



                                            </xsl:element>
                                            <xsl:element name="gmd:dateType">
                                                <xsl:element name="gmd:CI_DateTypeCode">
                                                  <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode</xsl:attribute>
                                                    <xsl:attribute name="codeListValue">publication date</xsl:attribute>publication date
                                                </xsl:element>
                                            </xsl:element>
                                        </xsl:element>
                                    </xsl:element>



                                </xsl:element>

                            </xsl:element>

                            <xsl:element name="gmd:sourceExtent">
                                <xsl:element name="gmd:EX_Extent">
                                    <xsl:element name="gmd:temporalElement">
                                        <xsl:element name="gmd:EX_TemporalExtent">
                                            <xsl:element name="gmd:extent">

                                                <!--   <xsl:element name="gml:description"><xsl:value-of select="./Time_Period_of_Content/Currentness_Reference"/></xsl:element>
                                             -->
                                                <xsl:variable name="BegDate" select="./Time_Period_of_Content/Range_of_Dates/Beginning_Date"/>
                                                <xsl:variable name="TimePeriodNameA" select="./Source_Citation_Abbreviation"/>

                                                <!--  <xsl:choose>
                                             <xsl:when test="contains($TimePeriodNameA,'NHD')">
                                                 <xsl:variable name="TimperiodB" select="substring($TimePeriodNameA,4)"/>
                                                 <xsl:variable name="TimperiodC" select="concat('NHD', $TimperiodB)"/>
                                             </xsl:when>
                                         </xsl:choose> -->


                                                <xsl:choose>
                                                    <xsl:when test="contains($BegDate,'unknown')">
                                                        <!--  <xsl:element name="gml:TimeInstant">
                                                            <xsl:choose>
                                                                <xsl:when test="contains($TimePeriodNameA,'NHD')">
                                                                    <xsl:variable name="TimperiodB" select="substring($TimePeriodNameA,4)"/>
                                                                    <xsl:variable name="TimperiodC" select="concat('NHD', $TimperiodB)"/>
                                                                    <xsl:variable name="TimePeriodD" select="translate($TimperiodC,' ','')"/>
                                                                    <xsl:attribute name="gml:id"><xsl:value-of select="$TimePeriodD"/></xsl:attribute>
                                                                </xsl:when>
                                                                <xsl:when test="contains($TimePeriodNameA,'MAF')">
                                                                    <xsl:attribute name="gml:id">CensusMafTiger</xsl:attribute>
                                                                </xsl:when>
                                                                <xsl:when test="contains($TimePeriodNameA,'ADCAN')">
                                                                    <xsl:attribute name="gml:id">CensusADCAN</xsl:attribute>
                                                                </xsl:when>
                                                            </xsl:choose>                                                          
                                                        </xsl:element> -->
                                                        </xsl:when>
                                                     <!--   <xsl:when test="./Source_Citation_Abbreviation">
                                                  <xsl:variable name="AppCheck"
                                                  select="./Source_Citation_Abbreviation"/>
                                                  <xsl:comment>AppCheck:<xsl:value-of
                                                  select="$AppCheck"/></xsl:comment>
                                                  <xsl:choose>
                                                  <xsl:when test="contains($AppCheck,'.')">
                                                  <xsl:variable name="TimperiodB"
                                                  select="substring-before($AppCheck,'.')"/>
                                                  <xsl:attribute name="gml:id">
                                                  <xsl:value-of select="TimperiodB"/>
                                                  </xsl:attribute>
                                                  </xsl:when>
                                                  <xsl:when test="contains($AppCheck,'_')">
                                                  <xsl:variable name="TimperiodB"
                                                  select="translate($TimePeriodNameA,'_','')"/>

                                                  <xsl:attribute name="gml:id">
                                                  <xsl:value-of select="TimperiodB"/>
                                                  </xsl:attribute>
                                                  </xsl:when>
                                                  <xsl:when test="contains($AppCheck,' ')">
                                                  <xsl:comment>In the space!!!!!!!!</xsl:comment>
                                                  <xsl:variable name="TimperiodB"
                                                  select="translate($TimePeriodNameA,' ','')"/>
                                                  <xsl:attribute name="gml:id">
                                                  <xsl:value-of select="$TimperiodB"/>
                                                  </xsl:attribute>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:attribute name="gml:id">
                                                  <xsl:value-of
                                                  select="./Source_Citation_Abbreviation"/>
                                                  </xsl:attribute>
                                                  </xsl:otherwise>
                                                  </xsl:choose>

                                                  </xsl:when>
                                                  <xsl:when test="./Citation/Title">
                                                  <xsl:variable name="TitleCheck"
                                                  select="./Citation/Title"/>
                                                  <xsl:comment>TitleCheck:<xsl:value-of
                                                  select="$TitleCheck"/></xsl:comment>
                                                  <xsl:choose>
                                                  <xsl:when test="contains($TitleCheck,'.')">
                                                  <xsl:variable name="TimperiodB"
                                                  select="substring-before($TitleCheck,'.')"/>
                                                  <xsl:attribute name="gml:id">
                                                  <xsl:value-of select="TimperiodB"/>
                                                  </xsl:attribute>
                                                  </xsl:when>
                                                  <xsl:when test="contains($TitleCheck,'_')">
                                                  <xsl:variable name="TimperiodB"
                                                  select="translate($TimePeriodNameA,'_','')"/>
                                                  <xsl:attribute name="gml:id">
                                                  <xsl:value-of select="TimperiodB"/>
                                                  </xsl:attribute>
                                                  </xsl:when>
                                                  </xsl:choose>
                                                  </xsl:when>
                                                

                                                  <xsl:element name="gml:description">
                                                  <xsl:value-of
                                                  select="./Time_Period_of_Content/Currentness_Reference"
                                                  />
                                                  </xsl:element>
                                                  <xsl:element name="gml:timePosition">
                                                  <xsl:attribute name="indeterminatePosition"
                                                  >unknown</xsl:attribute>
                                                  </xsl:element>
                                                
                                                  </xsl:when>
                                                  <xsl:when
                                                  test="./Time_Period_of_Content/Calendar_Date">
                                                  <xsl:element name="gml:TimeInstant">

                                                  <xsl:choose>
                                                  <xsl:when test="contains($TimePeriodNameA,'NHD')">
                                                  <xsl:variable name="TimperiodB"
                                                  select="substring($TimePeriodNameA,4)"/>
                                                  <xsl:variable name="TimperiodC"
                                                  select="concat('NHD', $TimperiodB)"/>
                                                  <xsl:attribute name="gml:id">
                                                  <xsl:value-of select="$TimperiodC"/>
                                                  </xsl:attribute>
                                                  </xsl:when>
                                                  <xsl:when test="contains($TimePeriodNameA,'MAF')">
                                                  <xsl:attribute name="gml:id"
                                                  >CensusMafTiger</xsl:attribute>
                                                  </xsl:when>
                                                  <xsl:when test="./Source_Citation_Abbreviation">
                                                  <xsl:variable name="AppCheck"
                                                  select="./Source_Citation_Abbreviation"/>
                                                  <xsl:comment>AppCheck:<xsl:value-of
                                                  select="$AppCheck"/></xsl:comment>
                                                  <xsl:choose>
                                                  <xsl:when test="contains($AppCheck,'.')">
                                                  <xsl:variable name="TimperiodB"
                                                  select="substring-before($AppCheck,'.')"/>
                                                  <xsl:attribute name="gml:id">
                                                  <xsl:value-of select="TimperiodB"/>
                                                  </xsl:attribute>
                                                  </xsl:when>
                                                  <xsl:when test="contains($AppCheck,'_')">
                                                  <xsl:comment>in the underscore</xsl:comment>
                                                  <xsl:variable name="TimperiodB"
                                                  select="translate($TimePeriodNameA,'_','')"/>
                                                  <xsl:comment>TimperiodB:<xsl:value-of
                                                  select="$TimperiodB"/></xsl:comment>
                                                  <xsl:attribute name="gml:id">
                                                  <xsl:value-of select="$TimperiodB"/>
                                                  </xsl:attribute>
                                                  </xsl:when>
                                                  <xsl:when test="contains($AppCheck,' ')">
                                                  <xsl:comment>In the space!!!!!!!!</xsl:comment>
                                                  <xsl:variable name="TimperiodB"
                                                  select="translate($TimePeriodNameA,' ','')"/>
                                                  <xsl:attribute name="gml:id">
                                                  <xsl:value-of select="$TimperiodB"/>
                                                  </xsl:attribute>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:attribute name="gml:id">
                                                  <xsl:value-of
                                                  select="./Source_Citation_Abbreviation"/>
                                                  </xsl:attribute>
                                                  </xsl:otherwise>

                                                  </xsl:choose>
                                                  
                                                  </xsl:when>
                                                  <xsl:when test="./Citation/Title">
                                                  <xsl:variable name="TitleCheck"
                                                  select="./Citation/Title"/>
                                                  <xsl:choose>
                                                  <xsl:when test="contains($TitleCheck,'.')">
                                                  <xsl:variable name="TimperiodB"
                                                  select="substring-before($TitleCheck,'.')"/>
                                                  <xsl:attribute name="gml:id">
                                                  <xsl:value-of select="TimperiodB"/>
                                                  </xsl:attribute>
                                                  </xsl:when>
                                                  <xsl:when test="contains($TitleCheck,'_')">
                                                  <xsl:variable name="TimperiodB"
                                                  select="translate($TimePeriodNameA,'_','')"/>
                                                  <xsl:attribute name="gml:id">
                                                  <xsl:value-of select="TimperiodB"/>
                                                  </xsl:attribute>
                                                  </xsl:when>
                                                  </xsl:choose>
                                                  </xsl:when>-->
                                                  </xsl:choose>

                                                  <xsl:element name="gml:description">
                                                  <xsl:value-of
                                                  select="./Time_Period_of_Content/Currentness_Reference"
                                                  />
                                                  </xsl:element>
                                                  <xsl:element name="gml:timePosition">
                                                  <xsl:value-of
                                                  select="./Time_Period_of_Content[1]/Calendar_Date[1]"
                                                  />
                                                  </xsl:element>
                                                  </xsl:element>

                                        </xsl:element>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:for-each>
                
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:element name="gml:TimePeriod">
                                                  <xsl:choose>
                                                  <xsl:when test="contains($TimePeriodNameA,'NHD')">
                                                  <xsl:variable name="TimperiodB"
                                                  select="substring($TimePeriodNameA,4)"/>
                                                  <xsl:variable name="TimperiodC"
                                                  select="concat('NHD', $TimperiodB)"/>
                                                  <xsl:attribute name="gml:id">
                                                  <xsl:value-of select="$TimperiodC"/>
                                                  </xsl:attribute>
                                                  </xsl:when>
                                                  <xsl:when test="contains($TimePeriodNameA,'MAF')">
                                                  <xsl:attribute name="gml:id"
                                                  >CensusMafTiger</xsl:attribute>
                                                  </xsl:when>
                                                  <xsl:when test="./Source_Citation_Abbreviation">
                                                  <xsl:attribute name="gml:id">
                                                  <xsl:value-of
                                                  select="./Source_Citation_Abbreviation"/>
                                                  </xsl:attribute>
                                                  </xsl:when>
                                                  </xsl:choose>

                                                  <xsl:element name="gml:description">
                                                  <xsl:value-of
                                                  select="./Time_Period_of_Content/Currentness_Reference"
                                                  />
                                                  </xsl:element>
                                                  <xsl:element name="gml:beginPosition">
                                                  <xsl:value-of
                                                  select="./Time_Period_of_Content/Range_of_Dates/Beginning_Date"
                                                  />
                                                  </xsl:element>
                                                  <xsl:element name="gml:endPosition">
                                                  <xsl:value-of
                                                  select="./Time_Period_of_Content[1]/Range_of_Dates[1]/Ending_Date[1]"
                                                  />
                                                  </xsl:element>
                                                  </xsl:element>
                                                  </xsl:otherwise>
                                                </xsl:choose>


                                            </xsl:element>
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
