<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        ${msg("emailVerifyTitle")}
    <#elseif section = "form">
        <div id="kc-info-message">
            <div class="alert alert-success" role="alert">
                <span class="kc-feedback-text">${message.summary}</span>
            </div>

            <#if pageRedirectUri?has_content>
                <div id="kc-form-buttons" style="margin-top: 2rem;">
                    <a href="${pageRedirectUri}" class="btn btn-primary" style="text-decoration: none; display: inline-block;">
                        ${kcSanitize(msg("backToApplication"))?no_esc}
                    </a>
                </div>
            <#elseif actionUri?has_content>
                <div id="kc-form-buttons" style="margin-top: 2rem;">
                    <a href="${actionUri}" class="btn btn-primary" style="text-decoration: none; display: inline-block;">
                        ${kcSanitize(msg("proceedWithAction"))?no_esc}
                    </a>
                </div>
            <#elseif (client.baseUrl)?has_content>
                <div id="kc-registration" style="margin-top: 1.5rem;">
                    <span><a href="${client.baseUrl}">Voltar para a aplicação</a></span>
                </div>
            </#if>
        </div>
    </#if>
</@layout.registrationLayout>
