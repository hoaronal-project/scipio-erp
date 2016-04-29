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

<#if canNotView>
  <@commonMsg type="error-perm">${uiLabelMap.AccountingCardInfoNotBelongToYou}.</@commonMsg>
  <@menu type="button">
    <@menuitem type="link" href=makeOfbizUrl("${donePage}") class="+${styles.action_nav!} ${styles.action_cancel!}" text=uiLabelMap.CommonGoBack />
  </@menu>
<#else>

<#macro menuContent menuArgs={}>
  <@menu args=menuArgs>
    <@menuitem type="link" href=makeOfbizUrl("${donePage}") class="+${styles.action_nav!} ${styles.action_cancel!}" text=uiLabelMap.CommonGoBack />
    <@menuitem type="link" href="javascript:document.editcreditcardform.submit()" class="+${styles.action_run_sys!} ${styles.action_update!}" text=uiLabelMap.CommonSave />
  </@menu>
</#macro>
<#assign sectionTitle><#if !creditCard??>${uiLabelMap.AccountingAddNewCreditCard}<#else><#-- Cato: duplicate: ${uiLabelMap.AccountingEditCreditCard}--></#if></#assign>
<@section title=sectionTitle menuContent=menuContent menuLayoutGeneral="bottom">

  <form method="post" action="<@ofbizUrl><#if !creditCard??>createCreditCard?DONE_PAGE=${donePage}<#else>updateCreditCard?DONE_PAGE=${donePage}</#if></@ofbizUrl>" name="editcreditcardform">
  
  <#if creditCard??>
    <input type="hidden" name="paymentMethodId" value="${paymentMethodId}" />
  </#if>  

         <@render resource="component://accounting/widget/CommonScreens.xml#creditCardFields" />
         <@field type="generic" label=uiLabelMap.PartyBillingAddress>
            <#-- Cato: Factored out for reuse -->
            <@render resource="component://shop/widget/CustomerScreens.xml#billaddresspick" 
                ctxVars={"billAddrNewAddrInline":false, "billAddrFieldNamePrefix":""}/>
         </@field>
       </div>
  </form>  
</@section>
</#if>

