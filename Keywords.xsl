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
            <xd:p>gpm2iso/Keywords.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 10, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>

<xsl:template name="ISOKeywords">
    <xsl:if test="/GPM/FGDC_Required/ISO_Theme">
        <xsl:element name="gmd:descriptiveKeywords">
            <xsl:element name="gmd:MD_Keywords">
                
               <!-- <xsl:for-each select="/GPM/FGDC_Required[1]/NGDA_Info[1]/NGDA_Keyword[1]">
                    <xsl:comment>In the keywords!!!!!!!!!</xsl:comment>
                    <xsl:element name="gmd:keyword">
                        <xsl:element name="gco:CharacterString"><xsl:value-of select="."/></xsl:element>
                    </xsl:element>
                </xsl:for-each> -->
                
                <xsl:element name="gmd:type">
                    <xsl:element name="gmd:MD_KeywordTypeCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_KeywordTypeCode</xsl:attribute>
                        <xsl:attribute name="codeListValue">theme</xsl:attribute>theme
                    </xsl:element>
                </xsl:element>
                
                <xsl:element name="gmd:thesaurusName">
                    <xsl:element name="gmd:CI_Citation">
                        <xsl:element name="gmd:title">
                            <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/FGDC_Required[1]/ISO_Theme[1]/ISO_Keyword_Thesaurus[1]"/></xsl:element>
                        </xsl:element>
                        <xsl:element name="gmd:date">
                            <xsl:element name="gmd:CI_Date">
                                <!--  <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>-->
                                <xsl:element name="gmd:date">
                                    <xsl:element name="gco:Date">2014-04-01</xsl:element>
                                </xsl:element>
                                <xsl:element name="gmd:dateType">
                                    <xsl:element name="gmd:CI_DateTypeCode">
                                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode</xsl:attribute>
                                        <xsl:attribute name="codeListValue">revision</xsl:attribute>revision </xsl:element>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
                
                
            </xsl:element>
        </xsl:element>
    </xsl:if>
</xsl:template>



    <xsl:template name="NGDAKeywords">
      <xsl:variable name="NGDA1" select="/GPM/FGDC_Required[1]/NGDA_Info[1]/NGDA_Keyword[1]"/>
        <xsl:variable name="NGDA2" select="/GPM/FGDC_Required[1]/NGDA_Info[1]/NGDA_Keyword[2]"/>
        <xsl:variable name="NGDA3" select="/GPM/FGDC_Required[1]/NGDA_Info[1]/NGDA_Keyword[2]"/>
        <xsl:variable name="NGDAPort1" select="/GPM/FGDC_Required[1]/NGDA_Info[1]/NGDA_Keyword[1]"/>
        <xsl:variable name="NGDAPort2" select="/GPM/FGDC_Required[1]/NGDA_Info[1]/NGDA_Keyword[2]"/>
        <xsl:variable name="NGDAPort3" select="/GPM/FGDC_Required[1]/NGDA_Info[1]/NGDA_Keyword[2]"/>
        <xsl:if test="/GPM/FGDC_Required[1]/NGDA_Info[1]">
            <xsl:element name="gmd:descriptiveKeywords">
                <xsl:element name="gmd:MD_Keywords">
                    
                   <!--   <xsl:element name="gmd:keyword">
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="/GPM/FGDC_Required[1]/NGDA_Info[1]/NGDA_Keyword[2]"/>
                        </xsl:element>
                        </xsl:element>-->
                    <xsl:for-each select="/GPM/FGDC_Required[1]/NGDA_Info[1]/NGDA_Keyword">
                        <xsl:element name="gmd:keyword">
                            <xsl:element name="gco:CharacterString">
                                <xsl:value-of select="."/>
                            </xsl:element>
                        </xsl:element>
                    </xsl:for-each>
                   
                    <xsl:choose>
                        <xsl:when test="$NGDA1='NGDA'"></xsl:when>
                        <xsl:when test="$NGDA2='NGDA'"></xsl:when>
                        <xsl:when test="$NGDA3='NGDA'"></xsl:when>
                        <xsl:otherwise>
                            <xsl:element name="gmd:keyword">
                                <xsl:element name="gco:CharacterString">NGDA</xsl:element>
                            </xsl:element>
                        </xsl:otherwise>
                    </xsl:choose>
                     <xsl:choose>
                         <xsl:when test="contains($NGDAPort1,'Portfolio')"></xsl:when>
                         <xsl:when test="contains($NGDAPort2,'Portfolio')"></xsl:when>
                         <xsl:when test="contains($NGDAPort3,'Portfolio')"></xsl:when>
                        <xsl:otherwise>
                            <xsl:element name="gmd:keyword">
                                <xsl:element name="gco:CharacterString">NGDA Portfolio Themes</xsl:element>
                            </xsl:element>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:element name="gmd:type">
                        <xsl:element name="gmd:MD_KeywordTypeCode">
                            <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_KeywordTypeCode</xsl:attribute>
                            <xsl:attribute name="codeListValue">theme</xsl:attribute>theme
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:thesaurusName">
                        <xsl:element name="gmd:CI_Citation">
                            
                            <xsl:element name="gmd:title">
                                <xsl:element name="gco:CharacterString">NGDA Portfolio Themes</xsl:element>
                            </xsl:element>
                            <xsl:element name="gmd:date">
                                <xsl:element name="gmd:CI_Date">
                                    <!--  <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>-->
                                    <xsl:element name="gmd:date">
                                        <xsl:element name="gco:Date">2017-03-24</xsl:element>
                                    </xsl:element>
                                    <xsl:element name="gmd:dateType">
                                        <xsl:element name="gmd:CI_DateTypeCode">
                                            <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode</xsl:attribute>
                                            <xsl:attribute name="codeListValue">revision</xsl:attribute>revision </xsl:element>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                            <xsl:element name="gmd:otherCitationDetails">
                                 <xsl:element name="gco:CharacterString">https://www.fgdc.gov/policyandplanning/a-16/appendixe/20170324-ngda-themes-fgdc-sc-revised-appendixe.pdf</xsl:element>
                                </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:if>
    </xsl:template>



    <xsl:template name="ThemeKeywords">
        <xsl:for-each select="/GPM/Identification_Information/Keywords/Theme">
            <xsl:element name="gmd:descriptiveKeywords">
                <xsl:element name="gmd:MD_Keywords">



                    <xsl:for-each select="./Theme_Keyword">
                        <xsl:element name="gmd:keyword">
                            <xsl:element name="gco:CharacterString">
                                <xsl:value-of select="."/>
                            </xsl:element>
                        </xsl:element>
                    </xsl:for-each>


                    <xsl:element name="gmd:type">
                        <xsl:element name="gmd:MD_KeywordTypeCode">
                            <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_KeywordTypeCode</xsl:attribute>
                            <xsl:attribute name="codeListValue">theme</xsl:attribute>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:thesaurusName">
                        <xsl:element name="gmd:CI_Citation">
                            <xsl:element name="gmd:title">
                                <xsl:element name="gco:CharacterString">
                                    <xsl:value-of select="./Theme_Keyword_Thesaurus[1]"/>
                                </xsl:element>
                            </xsl:element>
                            <xsl:element name="gmd:date">
                                <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="PlaceKeywords">
          <xsl:for-each select="/GPM/Identification_Information/Keywords/Place">
        <xsl:element name="gmd:descriptiveKeywords">
            <xsl:element name="gmd:MD_Keywords">
              
              <xsl:for-each select="./Place_Keyword">
                    <xsl:element name="gmd:keyword">
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="."/>
                        </xsl:element>
                    </xsl:element>
              </xsl:for-each>
                
                <xsl:element name="gmd:type">
                    <xsl:element name="gmd:MD_KeywordTypeCode">
                        <xsl:attribute name="codeList"
                            >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_KeywordTypeCode</xsl:attribute>
                        <xsl:attribute name="codeListValue">place</xsl:attribute>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="gmd:thesaurusName">
                    <xsl:element name="gmd:CI_Citation">
                        <xsl:element name="gmd:title">
                            <xsl:element name="gco:CharacterString">
                                <xsl:value-of select="./Place_Keyword_Thesaurus"/>
                            </xsl:element>
                        </xsl:element>
                        <xsl:element name="gmd:date">
                            <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
          </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
