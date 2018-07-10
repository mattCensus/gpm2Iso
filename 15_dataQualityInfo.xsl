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
            <xd:p>gpm2iso/15_dataQualityInfo.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 19, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>

    <xsl:template name="gpm2GmdDataQualityInfo">
        <xsl:element name="gmd:dataQualityInfo">
            <xsl:element name="gmd:DQ_DataQuality">

                <xsl:element name="gmd:scope">
                    <xsl:element name="gmd:DQ_Scope">
                        <xsl:element name="gmd:level">
                            <xsl:element name="gmd:MD_ScopeCode">
                                <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_ScopeCode</xsl:attribute>
                                <xsl:attribute name="codeListValue">
                                    <xsl:value-of select="/GPM/Metadata_Reference_Information[1]/Metadata_Hierarchy_Level[1]"/>
                                </xsl:attribute>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>

                <!-- /GPM/Data_Quality_Information[1]/Atribute_Accuracy_Report[1] -->

                <xsl:if test="/GPM/Data_Quality_Information[1]/Atribute_Accuracy_Report[1]">
                    <xsl:element name="gmd:report">
                        <xsl:element name="gmd:DQ_QuantitativeAttributeAccuracy">
                            <xsl:if  test="/GPM/Data_Quality_Information[1]/Atribute_Accuracy_Report[1]/Test_Report[1]/Measure[1]">
                                <xsl:element name="gmd:nameOfMeasure">
                                    <xsl:element name="gco:CharacterString">
                                        <xsl:value-of select="/GPM/Data_Quality_Information[1]/Atribute_Accuracy_Report[1]/Test_Report[1]/Measure[1]"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:if>
                            <xsl:if  test="/GPM/Data_Quality_Information[1]/Atribute_Accuracy_Report[1]/Test_Report[1]/Evaluation[1]">
                                <xsl:element name="gmd:evaluationMethodDescription">
                                    <xsl:element name="gco:CharacterString">
                                        <xsl:value-of select="/GPM/Data_Quality_Information[1]/Atribute_Accuracy_Report[1]/Test_Report[1]/Evaluation[1]"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:if>
                            <xsl:element name="gmd:result">
                                <xsl:element name="gmd:DQ_ConformanceResult">
                                    <xsl:element name="gmd:specification">
                                        <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                                    </xsl:element>
                                    <xsl:element name="gmd:explanation">
                                        <xsl:element name="gco:CharacterString">
                                            <xsl:value-of select="/GPM/Data_Quality_Information[1]/Atribute_Accuracy_Report[1]/Test_Report[1]/Result[1]"/>
                                        </xsl:element>
                                    </xsl:element>
                                    <xsl:element name="gmd:pass">
                                        <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:if>
                
                <xsl:if test="/GPM/Data_Quality_Information[1]/Non_Quantitative_Attribute_Accuracy_Report[1]">
                    <xsl:element name="gmd:report">
                            <xsl:element name="gmd:DQ_QuantitativeAttributeAccuracy">
  
                                <xsl:if test="/GPM/Data_Quality_Information[1]/Non_Quantitative_Attribute_Accuracy_Report[1]/Test_Report[1]/Measure[1]">
                                    <xsl:element name="gmd:nameOfMeasure">
                                        <xsl:element name="gco:CharacterString">
                                            <xsl:value-of select="/GPM/Data_Quality_Information[1]/Non_Quantitative_Attribute_Accuracy_Report[1]/Test_Report[1]/Measure[1]" />
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:if>

                               <xsl:if test="/GPM/Data_Quality_Information[1]/Non_Quantitative_Attribute_Accuracy_Report[1]/Test_Report[1]/Evaluation[1]">
                                   <xsl:element name="gmd:evaluationMethodDescription">
                                       <xsl:element name="gco:CharacterString">
                                           <xsl:value-of select="GPM/Data_Quality_Information[1]/Non_Quantitative_Attribute_Accuracy_Report[1]/Test_Report[1]/Evaluation[1]"/>
                                       </xsl:element>
                                   </xsl:element>
                               </xsl:if>
                                <xsl:element name="gmd:result">
                                    <xsl:element name="gmd:DQ_ConformanceResult">
                                        <xsl:element name="gmd:specification">
                                            <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                                        </xsl:element>
                                        <xsl:element name="gmd:explanation">
                                            <xsl:element name="gco:CharacterString">
                                                <xsl:value-of select="/GPM/Data_Quality_Information[1]/Non_Quantitative_Attribute_Accuracy_Report[1]/Test_Report[1]/Result[1]"/>
                                            </xsl:element>
                                        </xsl:element> 
                                        <xsl:element name="gmd:pass">
                                                <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                                            </xsl:element>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                </xsl:if>
                
                <xsl:if test="/GPM/Data_Quality_Information[1]/Logical_Consistency_Report[1]">
                    <xsl:element name="gmd:report">
                        <xsl:element name="gmd:DQ_ConceptualConsistency">
                            <xsl:if test="/GPM/Data_Quality_Information[1]/Logical_Consistency_Report[1]/Test_Report[1]/Measure[1]">
                                <xsl:if test="/GPM/Data_Quality_Information[1]/Non_Quantitative_Attribute_Accuracy_Report[1]/Test_Report[1]/Measure[1]">
                                    <xsl:element name="gmd:nameOfMeasure">
                                        <xsl:element name="gco:CharacterString">
                                            <xsl:value-of select="/GPM/Data_Quality_Information[1]/Non_Quantitative_Attribute_Accuracy_Report[1]/Test_Report[1]/Measure[1]"/>
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:if>
                                
                                <xsl:if test="/GPM/Data_Quality_Information[1]/Logical_Consistency_Report[1]/Test_Report[1]/Evaluation[1]">
                                    <xsl:element name="gmd:evaluationMethodDescription">
                                        <xsl:element name="gco:CharacterString">
                                            <xsl:value-of select="/GPM/Data_Quality_Information[1]/Logical_Consistency_Report[1]/Test_Report[1]/Evaluation[1]"/>
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:if>
                                
                                <xsl:element name="gmd:result">
                                    <xsl:element name="gmd:DQ_ConformanceResult">
                                        <xsl:element name="gmd:specification">
                                            <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                                        </xsl:element>
                                        <xsl:element name="gmd:explanation">
                                            <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Data_Quality_Information[1]/Logical_Consistency_Report[1]/Test_Report[1]/Result[1]"/>
                                            </xsl:element>
                                        </xsl:element>
                                        <xsl:element name="gmd:pass">
                                            <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:element>
                                
                            </xsl:if>
                        </xsl:element>
                    </xsl:element>
                </xsl:if>
                
                <xsl:element name="gmd:report">
                    <xsl:element name="gmd:DQ_CompletenessOmission">
                        
                        <xsl:if test="/GPM/Data_Quality_Information[1]/Completeness_Report[1]/Test_Report[1]/Measure[1]">
                            <xsl:element name="gmd:nameOfMeasure">
                                <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Data_Quality_Information[1]/Completeness_Report[1]/Test_Report[1]/Measure[1]"/></xsl:element>
                            </xsl:element>
                        </xsl:if>
                        
                        <xsl:if test="/GPM/Data_Quality_Information[1]/Completeness_Report[1]/Test_Report[1]/Evaluation[1]">
                            <xsl:element name="gmd:evaluationMethodDescription">
                                <xsl:element name="gco:CharacterString">
                                    <xsl:value-of select="/GPM/Data_Quality_Information[1]/Completeness_Report[1]/Test_Report[1]/Evaluation[1]"/>
                                </xsl:element>
                            </xsl:element>
                            
                            <xsl:element name="gmd:result">
                                <xsl:element name="gmd:DQ_ConformanceResult">
                                    <xsl:element name="gmd:specification">
                                        <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                                    </xsl:element>
                                    <xsl:element name="gmd:explanation">
                                        <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Data_Quality_Information[1]/Completeness_Report[1]/Test_Report[1]/Result[1]"/>
                                        </xsl:element>
                                    </xsl:element>
                                    <xsl:element name="gmd:pass">
                                        <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                            
                            
                        </xsl:if>
                        
                        
                    </xsl:element>
                </xsl:element>
                
                <!-- gmd:evaluationMethodDescription -->
                <xsl:element name="gmd:report">
                    <xsl:element name="gmd:DQ_CompletenessOmission">
                         
                        <xsl:if test="/GPM/Data_Quality_Information[1]/Horizontal_Positional_Accuracy_Report[1]/Test_Report[1]/Measure[1]">
                            <xsl:element name="gmd:nameOfMeasure">
                                <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Data_Quality_Information[1]/Horizontal_Positional_Accuracy_Report[1]/Test_Report[1]/Measure[1]"/>
                                </xsl:element>
                                </xsl:element>
                        </xsl:if>
                        
                        <xsl:if test="/GPM/Data_Quality_Information[1]/Horizontal_Positional_Accuracy_Report[1]/Test_Report[1]/Evaluation[1]">
                            <xsl:element name="gmd:evaluationMethodDescription">
                                <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Data_Quality_Information[1]/Horizontal_Positional_Accuracy_Report[1]/Test_Report[1]/Evaluation[1]"/> </xsl:element>
                            </xsl:element>
                        </xsl:if>
                        
                        <xsl:element name="gmd:result">
                            <xsl:element name="gmd:DQ_QuantitativeResult">
                                <xsl:element name="gmd:valueUnit">
                                    <xsl:element name="gml:BaseUnit">
                                        <xsl:attribute name="gml:id">meters</xsl:attribute>
                                        <xsl:element name="gml:identifier">
                                            <xsl:attribute name="codeSpace">meters</xsl:attribute>
                                        </xsl:element>
                                        <xsl:element name="gml:unitsSystem">
                                            <xsl:attribute name="xlink:href">http://www.bipm.org/en/si/</xsl:attribute>
                                        </xsl:element>
                                        
                                    </xsl:element>
                                </xsl:element>
                                
                                <xsl:for-each select="/GPM/Data_Quality_Information/Horizontal_Positional_Accuracy_Report/Test_Report/Result">
                                    <xsl:element name="gmd:value">
                                        <xsl:element name="gco:Record"><xsl:value-of select="."/></xsl:element>
                                    </xsl:element>
                                </xsl:for-each>
                                
                            </xsl:element>
                        </xsl:element>
                        
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
        
    </xsl:template>
</xsl:stylesheet>
