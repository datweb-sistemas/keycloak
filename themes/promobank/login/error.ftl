<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        ${msg("errorTitle")}
    <#elseif section = "form">
        <div id="kc-error-message">
            <div class="alert alert-error" role="alert">
                <span class="kc-feedback-text">
                    ${kcSanitize(message.summary)?no_esc}
                </span>
            </div>

            <#if skipLink??>
                <div id="kc-form-buttons" style="margin-top: 2rem;">
                    <a href="${skipLink?no_esc}" class="btn btn-primary" style="text-decoration: none; display: inline-block;">
                        ${kcSanitize(skipLinkText)?no_esc}
                    </a>
                </div>
            </#if>

            <#if client?? && client.baseUrl?has_content>
                <div id="kc-registration" style="margin-top: 1.5rem;">
                    <span><a href="${client.baseUrl}">Voltar para a aplicação</a></span>
                </div>
            </#if>
        </div>
    </#if>
</@layout.registrationLayout>
