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
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template name="SourceInformation">
         <xsl:element name="gmd:lineage">
             <xsl:element name="gmd:LI_Lineage">
    <xsl:for-each select="/GPM/Data_Quality_Information[1]/Process_Step">
       
        <xsl:element name="gmd:processStep">
            <xsl:element name="gmd:LI_ProcessStep">
                <xsl:element name="gmd:description">
                    <xsl:element name="gco:CharacterString"><xsl:value-of select="."/></xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
       
    </xsl:for-each>
         
         <xsl:for-each select="/GPM/Data_Quality_Information[1]/Source_Information">
             <xsl:variable name="ProperTitle" select="./Citation/Title"></xsl:variable>
             
             <xsl:variable name="ProperOriginator" select="./Citation/Originator"/>
             
             <xsl:element name="gmd:source">
              <xsl:comment>In the Source!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</xsl:comment>
             <xsl:element name="gmd:LI_Source">
                 <xsl:element name="gmd:description">
                     <xsl:element name="gco:CharacterString"><xsl:value-of select="./Source_Contribution"/></xsl:element>
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
                                          <xsl:when test="contains($DateType,'Unknown')">
                                              <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                                          </xsl:when>
                                       <!--   <xsl:otherwise>
                                             <xsl:element name="gco:Date"> <xsl:value-of select="./Citation/Publication_Date"/> </xsl:element>
                                         </xsl:otherwise>-->
                                          <xsl:otherwise>
                                              <xsl:element name="gco:Date"><xsl:value-of select="./Citation/Publication_Date"/></xsl:element>
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
                         
                         
                         <xsl:element name="gmd:citedResponsibleParty">
                             <xsl:element name="gmd:CI_ResponsibleParty">
                                 <xsl:element name="gmd:organisationName">
                                     <xsl:element name="gco:CharacterString"><xsl:value-of select="./Citation/Originator"></xsl:value-of></xsl:element>
                                 </xsl:element>
                                 <xsl:element name="gmd:role">
                                     <xsl:element name="gmd:CI_RoleCode">
                                         <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_RoleCode</xsl:attribute>
                                         <xsl:attribute name="codeListValue">resourceProvider</xsl:attribute>
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
                                        
                                             <xsl:variable name="BegDate" select="./Time_Period_of_Content/Range_of_Dates/Beginning_Date"/>
                                             <xsl:variable name="EndDate" select="./Time_Period_of_Content/Range_of_Dates/Ending_Date"/>
                                         <xsl:variable name="TimePeriodNameA" select="./Source_Citation_Abbreviation"/>
                                         <xsl:variable name="TimeTitle" select="./Citation/Title"></xsl:variable>
                                         
                                     
                                     
                                     
                                        
                                         
                                       
                                          <xsl:choose>
                                           
                                            
                                             <xsl:when test="contains($BegDate,'unknown')">
                                                 <xsl:comment>In the unknown!!!!!!!!</xsl:comment>
                                                 <xsl:comment>TimePeriodNameA: <xsl:value-of select="$TimePeriodNameA"/></xsl:comment>
                                                 <xsl:choose>
                                                     <xsl:when test="contains($TimePeriodNameA,'NHD')">
                                                           <xsl:comment>in the NHD!!!!!!!!!!!!!!</xsl:comment>
                                                         <xsl:element name="gml:TimeInstant">
                                                             <xsl:variable name="NameNhd" select="./Citation/Originator"/>
                                                             <xsl:variable name="NHD2" select="substring($NameNhd,0,4)"/>
                                                             <xsl:variable name="ConcatNHD" select="concat('NHD',$NHD2)"/>
                                                              <xsl:attribute name="gml:id"><xsl:value-of select="$ConcatNHD"/></xsl:attribute>
                                                             <xsl:element name="gml:description"><xsl:value-of select="./Time_Period_of_Content/Currentness_Reference"/></xsl:element>
                                                             <xsl:element name="gml:timePosition">
                                                                 <xsl:attribute name="indeterminatePosition">unknown</xsl:attribute>
                                                             </xsl:element>
                                                         </xsl:element>
                                                     </xsl:when>
                                                     <xsl:when test="contains($TimePeriodNameA,'MAF')">
                                                           <xsl:comment>In the MAF</xsl:comment>
                                                         <xsl:element name="gml:TimeInstant">
                                                             <xsl:attribute name="gml:id">CensusMafTiger</xsl:attribute>
                                                             <xsl:element name="gml:description"><xsl:value-of select="./Time_Period_of_Content/Currentness_Reference"/></xsl:element>
                                                             <xsl:element name="gml:timePosition">
                                                                 <xsl:attribute name="indeterminatePosition">unknown</xsl:attribute>
                                                             </xsl:element>
                                                         </xsl:element>
                                                     </xsl:when>
                                                     <xsl:when test="contains($TimePeriodNameA,'ADCAN')">
                                                         <xsl:comment>In the ADCAN yes3</xsl:comment>
                                                         <xsl:element name="gml:TimeInstant">
                                                             <xsl:attribute name="gml:id">CensusADCAN</xsl:attribute>
                                                             <xsl:element name="gml:description"><xsl:value-of select="./Time_Period_of_Content/Currentness_Reference"/></xsl:element>
                                                             <xsl:element name="gml:timePosition">
                                                             <xsl:attribute name="indeterminatePosition">unknown</xsl:attribute>
                                                             </xsl:element>
                                                         </xsl:element>
                                                     </xsl:when>
                                                     <xsl:when test="contains($TimePeriodNameA,'LFGPB')">
                                                          <xsl:comment>in the LFGPB number1</xsl:comment>
                                                         <xsl:element name="gml:TimeInstant">
                                                             <xsl:attribute name="gml:id">LFGPB</xsl:attribute>
                                                             <xsl:element name="gml:description"><xsl:value-of select="./Time_Period_of_Content/Currentness_Reference"/></xsl:element>
                                                             <xsl:element name="gml:timePosition">
                                                                 <xsl:attribute name="indeterminatePosition">unknown</xsl:attribute>
                                                             </xsl:element>
                                                         </xsl:element>
                                                     </xsl:when>
                                                     
                                                     <xsl:when test="contains($TimePeriodNameA,'AKDOTGIS')">
                                                          <xsl:comment>In the AKDOTGIS Time Period</xsl:comment>
                                                         <xsl:element name="gml:TimeInstant">
                                                             <xsl:attribute name="gml:id">AKDOTGISTimePeriod</xsl:attribute>
                                                             <xsl:element name="gml:description"><xsl:value-of select="./Time_Period_of_Content/Currentness_Reference"/></xsl:element>
                                                             <xsl:element name="gml:timePosition">
                                                                 <xsl:attribute name="indeterminatePosition">unknown</xsl:attribute>
                                                             </xsl:element>
                                                         </xsl:element>
                                                     </xsl:when>
                                                     <xsl:when test="contains($TimePeriodNameA,'AK')">
                                                      <xsl:comment>Alaska Time Period!!!!!!!!!!!!!!!!</xsl:comment>
                                                         <xsl:choose>
                                                             <xsl:when test="contains($TimePeriodNameA,'RGB')">
                                                                 <xsl:element name="gml:TimeInstant">
                                                                     
                                                                     <xsl:attribute name="gml:id">AKRGB</xsl:attribute>
                                                                     <xsl:element name="gml:description"><xsl:value-of select="./Time_Period_of_Content/Currentness_Reference"/></xsl:element>
                                                                     <xsl:element name="gml:timePosition">
                                                                         <xsl:attribute name="indeterminatePosition">unknown</xsl:attribute>
                                                                     </xsl:element>
                                                                 </xsl:element>
                                                             </xsl:when>
                                                             <xsl:otherwise>
                                                                 <xsl:element name="gml:TimeInstant">
                                                                      <xsl:comment>right here</xsl:comment>
                                                                     <xsl:variable name="AKTitle" select="./Citation/Title"/>
                                                                     <xsl:variable name="AKGMLID" select="concat($AKTitle,'AK')"/>
                                                                     <xsl:attribute name="gml:id"><xsl:value-of select="$AKGMLID"/></xsl:attribute>
                                                                     <xsl:element name="gml:description"><xsl:value-of select="./Time_Period_of_Content/Currentness_Reference"/></xsl:element>
                                                                     <xsl:element name="gml:timePosition">
                                                                         <xsl:attribute name="indeterminatePosition">unknown</xsl:attribute>
                                                                     </xsl:element>
                                                                 </xsl:element>
                                                            </xsl:otherwise>
                                                             
                                                         </xsl:choose>
                                                         
                                                     </xsl:when>
                                                     
                                                     <xsl:when test="contains($TimeTitle,'AKDOTGIS')">
                                                          <xsl:comment>In the AKDOTGIS Title</xsl:comment> 
                                                         <xsl:variable name="AkNumber" select="substring($TimeTitle,0,4)"></xsl:variable>
                                                         <xsl:variable name="FinalAk" select="concat('AK',$AkNumber)"/>
                                                         <xsl:element name="gml:TimeInstant">
                                                             <xsl:attribute name="gml:id"><xsl:value-of select="$FinalAk"/></xsl:attribute>
                                                             <xsl:element name="gml:description"><xsl:value-of select="./Time_Period_of_Content/Currentness_Reference"/></xsl:element>
                                                             <xsl:element name="gml:timePosition">
                                                                 <xsl:attribute name="indeterminatePosition">unknown</xsl:attribute>
                                                             </xsl:element>
                                                         </xsl:element>
                                                     </xsl:when>
                                                     
                                                     <xsl:when test="contains($TimeTitle,'AK')">
                                                         <xsl:comment>Alaska Title!!!!!!!!!!!!!!!!</xsl:comment>
                                                         <xsl:variable name="AkNumber" select="substring($TimeTitle,0,4)"></xsl:variable>
                                                         <xsl:variable name="FinalAk" select="concat('AK',$AkNumber)"/>
                                                         <xsl:element name="gml:TimeInstant">
                                                             <xsl:attribute name="gml:id"><xsl:value-of select="$FinalAk"/></xsl:attribute>
                                                             <xsl:element name="gml:description"><xsl:value-of select="./Time_Period_of_Content/Currentness_Reference"/></xsl:element>
                                                             <xsl:element name="gml:timePosition">
                                                                 <xsl:attribute name="indeterminatePosition">unknown</xsl:attribute>
                                                             </xsl:element>
                                                         </xsl:element>
                                                         
                                                     </xsl:when>
                                                     <xsl:when test="./Source_Citation_Abbreviation">  
                                                         <xsl:comment>Source Citation Abbrevation</xsl:comment>
                                                         <xsl:element name="gml:TimeInstant">
                                                             <xsl:variable name="SCA" select="substring($TimePeriodNameA,0,4)"></xsl:variable>
                                                             <xsl:element name="gml:TimeInstant">
                                                             <xsl:attribute name="gml:id"><xsl:value-of select="$SCA"></xsl:value-of></xsl:attribute>
                                                                 <xsl:element name="gml:description"><xsl:value-of select="./Time_Period_of_Content/Currentness_Reference"/></xsl:element>
                                                                 <xsl:element name="gml:timePosition">
                                                                     <xsl:attribute name="indeterminatePosition">unknown</xsl:attribute>
                                                                 </xsl:element>
                                                             </xsl:element>
                  
                                                         </xsl:element>
                                                         
                                                     </xsl:when>
                                                     <xsl:when test="./Title">
                                                        <xsl:comment>In the Title</xsl:comment> 
                                                         <xsl:element name="gml:TimeInstant">
                                                             <xsl:variable name="tCA" select="substring($TimeTitle,0,4)"></xsl:variable>
                                                             <xsl:element name="gml:TimeInstant">
                                                                 <xsl:attribute name="gml:id"><xsl:value-of select="$tCA"></xsl:value-of></xsl:attribute>
                                                                 <xsl:element name="gml:description"><xsl:value-of select="./Time_Period_of_Content/Currentness_Reference"/></xsl:element>
                                                                 <xsl:element name="gml:timePosition">
                                                                     <xsl:attribute name="indeterminatePosition">unknown</xsl:attribute>
                                                                 </xsl:element>
                                                             </xsl:element>
                                                             
                                                         </xsl:element>
                                                     </xsl:when> 
                                                     
                                                 
                                       
                                         </xsl:choose> -->
                                     </xsl:element>
                                             
                                             <xsl:when test="./Source_Citation_Abbreviation">  
                                                 <xsl:comment>in the  source citation 2</xsl:comment>
                                                 <xsl:variable name="AppCheck" select="./Source_Citation_Abbreviation"/>
                                                 
                                                 <xsl:choose>
                                                     
                                                     <xsl:when test="contains($AppCheck,'NHD')">
                                                         <xsl:comment>In the NHD (source) I am using the translate here!!!!!!!!!!</xsl:comment>
                                                         <xsl:variable name="TimperiodB" select="substring($TimePeriodNameA,4)"/>
                                                         <xsl:variable name="TimperiodC" select="concat('NHD', $TimperiodB)"/>
                                                         <xsl:variable name="TimePeriodD" select="translate($TimperiodC,' ','')"></xsl:variable>
                                                        <xsl:comment>TimePeriodD: <xsl:value-of select="$TimePeriodD"/></xsl:comment>
                                                         
                                                           <xsl:variable name="TitleOne" select="../Source_Information/Citation/Title"/>
                                                         
                                                         <xsl:variable name="TitleTwo" select="translate($ProperTitle,'/','')"/>
                                                         <xsl:variable name="TitleThree" select="translate($TitleTwo,'-','')"/> 
                                                         <xsl:variable name="TitleFour" select="translate($TitleThree,'.','')"/>
                                                         
                                                         <xsl:variable name="OrigTwo" select="translate($ProperOriginator,' ','')"/>
                                                         <xsl:variable name="OrigThree" select="translate($OrigTwo,'C&amp;R','')"/>
                                                         <xsl:variable name="OrigFour" select="translate($OrigThree,'()','')"/>
                                                         <xsl:variable name="OrigFive" select="translate($OrigFour,'-','')"/>
                                                         
                                                         <!-- <xsl:attribute name="gml:id"><xsl:value-of select="$TimePeriodD"/></xsl:attribute> -->
                                                         <xsl:element name="gml:TimeInstant">
                                                            
                                                             <xsl:variable name="FINALTimeperiod" select="concat($TimePeriodD,$AppCheck,$TitleFour,$OrigFive)"/>
                                                             <xsl:variable name="FINALTimeperiod2A" select="translate($FINALTimeperiod,' ','')"/>
                                                            
                                                             <xsl:attribute name="gml:id"><xsl:value-of select="$FINALTimeperiod2A"/></xsl:attribute>
                                                             <xsl:element name="gml:description"><xsl:value-of select="./Time_Period_of_Content/Currentness_Reference"/></xsl:element>
                                                             <xsl:element name="gml:timePosition">
                                                                 <xsl:attribute name="indeterminatePosition">unknown</xsl:attribute>
                                                             </xsl:element>
                                                         </xsl:element>
                                                     </xsl:when>
                                                     <xsl:when test="contains($AppCheck,'MAF')">
                                                         <xsl:element name="gml:TimePeriod">
                                                         <xsl:attribute name="gml:id">CensusMafTiger</xsl:attribute>
                                                         <xsl:element name="gml:description"><xsl:value-of select="./Time_Period_of_Content/Currentness_Reference"/></xsl:element>
                                                         <xsl:element name="gml:beginPosition">
                                                             <xsl:value-of select="./Time_Period_of_Content/Range_of_Dates/Beginning_Date"/>
                                                         </xsl:element>
                                                         <xsl:element name="gml:endPosition">
                                                             <xsl:value-of select="./Time_Period_of_Content[1]/Range_of_Dates[1]/Ending_Date[1]"/>
                                                         </xsl:element>
                                                         </xsl:element>
                                                     </xsl:when>
                                                     <xsl:when test="contains($AppCheck,'AKDOTGIS')">
                                                         <xsl:element name="gml:TimeInstant">
                                                         <xsl:attribute name="gml:id">AKDOTGISsourcea</xsl:attribute>
                                                         <xsl:element name="gml:description"><xsl:value-of select="./Time_Period_of_Content/Currentness_Reference"/></xsl:element>
                                                             <xsl:element name="gml:timePosition">
                                                                 <xsl:attribute name="indeterminatePosition">unknown</xsl:attribute>
                                                             </xsl:element>
                                                         </xsl:element>
                                                     </xsl:when>
                                                     <xsl:when test="contains($AppCheck,'ADCAN')">
                                                         <xsl:comment>In the ADCAN type 4</xsl:comment>
                                                         <xsl:attribute name="gml:id">CensusADCAN</xsl:attribute>
                                                     </xsl:when>
                                                     
                                                     <xsl:when test="not($BegDate =$EndDate)">
                                                                <xsl:comment>Two dates not equal</xsl:comment>
                                                               <!--  <xsl:element name="gml:TimePeriod">                                                                                     
                                                                   <xsl:variable name="TitleB" select="substring($ProperTitle,0,5)"/>
                                                                   <xsl:variable name="finalTitle" select="concat('ADCAN',$TitleB,$BegDate)"/>
                                                                   <xsl:variable name="timeId" select="substring($ProperTitle,0,5)"/>
                                                                   <xsl:attribute name="gml:id"><xsl:value-of select="$finalTitle"/></xsl:attribute>
                                                                   <xsl:element name="gml:description"><xsl:value-of select="./Time_Period_of_Content/Currentness_Reference"/></xsl:element>
                                                                   <xsl:element name="gml:beginPosition"><xsl:value-of select="$BegDate"/></xsl:element>
                                                                   <xsl:element name="gml:endPosition"> <xsl:value-of select="$EndDate"/></xsl:element>
                                                               </xsl:element>-->
                                                           </xsl:when>
                                                          
                                                           
                                                       <xsl:otherwise>
                                                           <xsl:comment>in the unknown</xsl:comment>
                                                           <xsl:element name="gml:TimeInstant">
                                                               <xsl:variable name="TitleB" select="substring($ProperTitle,0,5)"/>
                                                               <xsl:variable name="finalTitleB" select="concat('ADCAN',$TitleB,$BegDate)" ></xsl:variable>
                                                               <xsl:variable name="timeId" select="substring($ProperTitle,0,5)"/>
                                                               <xsl:attribute name="gml:id"><xsl:value-of select="$finalTitleB"/></xsl:attribute>
                                                               <xsl:element name="gml:description"><xsl:value-of select="./Time_Period_of_Content/Currentness_Reference"/></xsl:element>
                                                               <xsl:element name="gml:timePosition">
                                                                  
                                                                   <!-- <xsl:variable name="finalTitleB" select="concat('ADCAN',$TitleB,$BegDate)"/> -->
                                                                  
                                                                   
                                                                   <xsl:attribute name="indeterminatePosition">unknown</xsl:attribute>
                                                               </xsl:element>
                                                           </xsl:element>
                                                       </xsl:otherwise>
                                                       </xsl:choose>
                                                     </xsl:when>
                                                     
                                                     <xsl:when test="contains($AppCheck,'RGB')">
                                                         
                                                          <xsl:comment>Is the problem here????????????????????????</xsl:comment>
                                                         <xsl:element name="gml:TimeInstant">
                                                             <xsl:attribute name="gml:id">RGB</xsl:attribute>
                                                             <xsl:element name="gml:description"><xsl:value-of select="./Time_Period_of_Content/Currentness_Reference"/></xsl:element>
                                                             <xsl:element name="gml:timePosition">
                                                                 <xsl:attribute name="indeterminatePosition">unknown</xsl:attribute>
                                                             </xsl:element>
                                                         </xsl:element>
                                                         <!--    <xsl:attribute name="gml:id">AK</xsl:attribute>-->
                                                     </xsl:when>    
                                                     
                                                     <xsl:when test="contains($AppCheck,'AK')">
                                                         <xsl:variable name="AKTITLE" select="./Citation/Title"/>
                                                             <xsl:variable name="AKTITLE2" select="translate($AKTITLE,'_','')"/>
                                                             <xsl:variable name="AKTITLE3" select="concat('AK',$AKTITLE2)"/>
                                                       <xsl:comment>Is the problem here????????????????????????</xsl:comment>
                                                         <xsl:element name="gml:TimeInstant">
                                                             <xsl:attribute name="gml:id"><xsl:value-of select="$AKTITLE3"/></xsl:attribute>
                                                         <xsl:element name="gml:description"><xsl:value-of select="./Time_Period_of_Content/Currentness_Reference"/></xsl:element>
                                                         <xsl:element name="gml:timePosition">
                                                             <xsl:attribute name="indeterminatePosition">unknown</xsl:attribute>
                                                         </xsl:element>
                                                         </xsl:element>
                                                        <!--    <xsl:attribute name="gml:id">AK</xsl:attribute>-->
                                                     </xsl:when>
                                                     
                                                     <xsl:when test="contains($AppCheck,'.')">
                                                         <xsl:variable name="TimperiodCA" select="substring-before($AppCheck,'.')"/>
                                                         <xsl:attribute name="gml:id"><xsl:value-of select="TimperiodCA"/></xsl:attribute>
                                                     </xsl:when>
                                                     <xsl:when test="contains($AppCheck,'_')">
                                                          <!-- <xsl:variable name="TimperiodB" select="substring-before($AppCheck,'_')"/>
                                                        <xsl:attribute name="gml:id"><xsl:value-of select="TimperiodB"/></xsl:attribute> -->
                                                     </xsl:when>
                                                     <xsl:when test="not($BegDate =$EndDate)">
                                                          <xsl:comment>Two dates not equal Number 2</xsl:comment> 
                                                         <!-- <xsl:element name="gmd:sourceExtent">
                                                             <xsl:element name="gmd:EX_Extent">
                                                                 <xsl:element name="gmd:temporalElement">
                                                                     <xsl:element name="gmd:EX_TemporalExtent">
                                                                         <xsl:element name="gmd:extent"> -->
                                                                             <xsl:element name="gml:TimePeriod">
                                                                                 <!-- /GPM/Data_Quality_Information[1]/Source_Information -->
                                                                                 <xsl:variable name="Title" select="./Citation/Title"/>
                                                                                 <xsl:variable name="TitleB" select="substring($Title,0,5)"/>
                                                                                 
                                                                                 <xsl:variable name="sorAbbr" select="./Source_Citation_Abbreviation[1]"/>
                                                                                 <xsl:variable name="SorTwo" select="translate($sorAbbr,' ','')"/>
                                                                                 <xsl:variable name="SorThree" select="translate($SorTwo,'-','')"/>
                                                                                 
                                                                                 <!--  <xsl:comment>TitleB: <xsl:value-of select="$TitleB"/></xsl:comment>-->
                                                                                 <xsl:variable name="finalTitle" select="concat('Source',$SorThree,$TitleB,$BegDate)"/>
                                                                                 <xsl:variable name="timeId" select="substring($Title,0,5)"/>
                                                                                 <xsl:attribute name="gml:id"><xsl:value-of select="$finalTitle"/></xsl:attribute>
                                                                                 <xsl:element name="gml:beginPosition"><xsl:value-of select="$BegDate"/></xsl:element>
                                                                                 <xsl:element name="gml:endPosition"> <xsl:value-of select="$EndDate"/></xsl:element>                                                                           
                                                         </xsl:element>
                                                     </xsl:when>
                                                     
                                                     
                                                     
                                                     
                                                     <xsl:when test="$BegDate =$EndDate">
                                                         <!-- single date -->
                                                         <xsl:comment>Two dates are equal---------------</xsl:comment>
                                                                        
                                                         <xsl:element name="gml:TimeInstant">
                                                                                 
                                                                                 <!-- <xsl:variable name="Title" select="./Title"/> -->
                                                                                 <xsl:variable name="TitleB" select="substring($ProperTitle,0,5)"/>
                                                                                 <xsl:variable name="TitleC" select="translate($ProperTitle,' ','')"/>
                                                                                 
                                                                                 <xsl:variable name="NewOrig" select="translate($ProperOriginator,' ','')"/>
                                                                                 <xsl:variable name="NewOrig2" select="translate($NewOrig,',','')"/>
                                                                                 <xsl:variable name="NewOrig3" select="translate($NewOrig2,';','')"/>
                                                                                 <xsl:variable name="NewOrig4" select="translate($NewOrig3,'.shp','')"/>
                                                                                 <xsl:variable name="NewOrig5" select="translate($NewOrig4,'-','')"/>
                                                                                 <xsl:variable name="NewOrig6" select="translate($NewOrig5,'&#xA;','')"/> 
                                                                                 
                                                                                 <xsl:variable name="finalTitle" select="concat('id',$TitleC,$NewOrig6, $BegDate)"/>
                                                                                 <xsl:variable name="timeId" select="substring($ProperTitle,0,5)"/>
                                                                                 <xsl:attribute name="gml:id"><xsl:value-of select="$finalTitle"/></xsl:attribute>
                                                             
                                                                                 <xsl:element name="gml:description"><xsl:value-of select="./Time_Period_of_Content/Currentness_Reference"/></xsl:element>
                                                                                 <xsl:element name="gml:timePosition">
                                                                                     <xsl:value-of select="$BegDate"/>
                                                                                 </xsl:element>
                                                         </xsl:element> 
                                                     </xsl:when>
                                                    <!--  <xsl:otherwise>
                                                         <xsl:comment>In the otherwise for the Source_Citation_Abbrevation!!!!!!!!!!!</xsl:comment>
                                                         <xsl:attribute name="gml:id"><xsl:value-of select="$AppCheck"></xsl:value-of></xsl:attribute>
                                                         <xsl:variable name="Title" select="./Title"/>
                                                         <xsl:variable name="TitleB" select="substring($Title,0,5)"/>
                                                         <xsl:variable name="begDate" select="./Beginning_Date"/>
                                                         <xsl:variable name="finalTitle" select="concat($TitleB,$begDate)"/>
                                                         <xsl:variable name="timeId" select="substring($Title,0,5)"/>
                                                         
                                                         <xsl:element name="gml:TimePeriod">
                                                             <xsl:attribute name="gml:id"><xsl:value-of select="$timeId"/></xsl:attribute>
                                                             <xsl:element name="gml:description"><xsl:value-of select="./Time_Period_of_Content/Currentness_Reference"/></xsl:element>
                                                             <xsl:element name="gml:beginPosition">
                                                                 <xsl:value-of select="./Time_Period_of_Content/Range_of_Dates/Beginning_Date"/>
                                                             </xsl:element>
                                                             <xsl:element name="gml:endPosition">
                                                                 <xsl:value-of select="./Time_Period_of_Content[1]/Range_of_Dates[1]/Ending_Date[1]"/>
                                                             </xsl:element>
                                                         </xsl:element>
                                                     </xsl:otherwise>-->
                                 </xsl:element>
                                 </xsl:element>
                                                 </xsl:choose>
                                   
                                             </xsl:when> 
                                             <xsl:when test="./Citation/Title">
                                                 <xsl:comment>in the unknow title citation</xsl:comment>
                                                 
                                             </xsl:when>
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