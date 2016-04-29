<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->

<@fields type="default-manual" ignoreParentField=true>
    <#-- Removed because is confusing, can add but would have to come back here with all data populated as before...
    <a href="<@ofbizUrl>editcontactmech</@ofbizUrl>" class="${styles.link_nav!} ${styles.action_add!}">
      [Create New Address]</a>&nbsp;&nbsp;
    -->
 <@table type="data-complex">
 <#assign hasCurrent = false />
 <#if curPostalAddress?has_content>
   <#assign hasCurrent = true />
   <@tr>
     <@td align="right" valign="top">
       <@field type="radio" inline=true name="${fieldNamePrefix}contactMechId" value="${curContactMechId}" checked="checked" class="+${fieldClass}"  />
     </@td>
     <@td valign="top">
       <p><b>${uiLabelMap.PartyUseCurrentAddress}:</b></p>
       <#list curPartyContactMechPurposes as curPartyContactMechPurpose>
         <#assign curContactMechPurposeType = curPartyContactMechPurpose.getRelatedOne("ContactMechPurposeType", true) />
         <div>
           ${curContactMechPurposeType.get("description",locale)!}
           <#if curPartyContactMechPurpose.thruDate??>
             ((${uiLabelMap.CommonExpire}:${curPartyContactMechPurpose.thruDate.toString()})
           </#if>
         </div>
       </#list>
       <div>
       <#if curPostalAddress.toName??>${uiLabelMap.CommonTo}: ${curPostalAddress.toName!}<br /></#if>
       <#if curPostalAddress.attnName??>${uiLabelMap.PartyAddrAttnName}: ${curPostalAddress.attnName1}<br /></#if>
         ${curPostalAddress.address1!}<br />
       <#if curPostalAddress.address2??>${curPostalAddress.address2!}<br /></#if>
         ${curPostalAddress.city!}<#if curPostalAddress.stateProvinceGeoId?has_content>,&nbsp;${curPostalAddress.stateProvinceGeoId}</#if>&nbsp;${curPostalAddress.postalCode!}
       <#if curPostalAddress.countryGeoId??><br />${curPostalAddress.countryGeoId!}</#if>
       <div>(${uiLabelMap.CommonUpdated}:&nbsp;${(curPartyContactMech.fromDate.toString())!})</div>
       <#if curPartyContactMech.thruDate??><div>${uiLabelMap.CommonDelete}:&nbsp;${curPartyContactMech.thruDate.toString()}</#if>
       </div>
     </@td>
   </@tr>
 <#else>
   <#-- <@tr>
    <@td valign="top" colspan="2">${uiLabelMap.PartyBillingAddressNotSelected}
    </@td>
  </@tr> -->
 </#if>
  <#-- is confusing
  <@tr>
    <@td valign="top" colspan="2">${uiLabelMap.EcommerceMessage3}
    </@td>
  </@tr>
  -->
 <#list postalAddressInfos as postalAddressInfo>
   <#assign contactMech = postalAddressInfo.contactMech />
   <#assign partyContactMechPurposes = postalAddressInfo.partyContactMechPurposes />
   <#assign postalAddress = postalAddressInfo.postalAddress />
   <#assign partyContactMech = postalAddressInfo.partyContactMech />
   <@tr>
     <@td align="right" valign="top">
       <@field type="radio" inline=true name="${fieldNamePrefix}contactMechId" value="${contactMech.contactMechId}" class="+${fieldClass}" />
     </@td>
     <@td valign="middle">
       <#list partyContactMechPurposes as partyContactMechPurpose>
         <#assign contactMechPurposeType = partyContactMechPurpose.getRelatedOne("ContactMechPurposeType", true) />
         <div>
           ${contactMechPurposeType.get("description",locale)!}
           <#if partyContactMechPurpose.thruDate??>(${uiLabelMap.CommonExpire}:${partyContactMechPurpose.thruDate})</#if>
         </div>
       </#list>
       <div>
         <#if postalAddress.toName??>${uiLabelMap.CommonTo}: ${postalAddress.toName!}<br /></#if>
         <#if postalAddress.attnName??>${uiLabelMap.PartyAddrAttnName}: ${postalAddress.attnName!}<br /></#if>
         ${postalAddress.address1!}<br />
         <#if postalAddress.address2??>${postalAddress.address2}<br /></#if>
         ${postalAddress.city!}<#if postalAddress.stateProvinceGeoId?has_content>,&nbsp;${postalAddress.stateProvinceGeoId}</#if>&nbsp;${postalAddress.postalCode!}
         <#if postalAddress.countryGeoId??><br />${postalAddress.countryGeoId!}</#if>
       </div>
       <div>(${uiLabelMap.CommonUpdated}:&nbsp;${(partyContactMech.fromDate.toString())!})</div>
       <#if partyContactMech.thruDate??><div>${uiLabelMap.CommonDelete}:&nbsp;${partyContactMech.thruDate.toString()}</div></#if>
     </@td>
   </@tr>
   </#list>
   <#if !postalAddressInfos?has_content && !curContactMech??>
     <@tr><@td colspan="2">${uiLabelMap.PartyNoContactInformation}.</@td></@tr>
   </#if>
   <@tr>
     <@td align="right" valign="top">
       <@field type="radio" inline=true name="${fieldNamePrefix}contactMechId" value="_NEW_" checked=(!hasCurrent) class="+${fieldClass}" />
     </@td>
     <@td valign="middle">
       ${uiLabelMap.PartyCreateNewBillingAddress}.
       <#if newAddrInline>
         <div<#if newAddrContentId?has_content> id="${newAddrContentId}"</#if>>
           (NOT IMPLEMENTED)
         </div>       
       </#if>
     </@td>
   </@tr>
 </@table>
</@fields>

