<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "header">
        Recuperar Senha
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <p class="instruction">
                    Digite seu nome de usuário ou e-mail. Enviaremos instruções para redefinir sua senha.
                </p>

                <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                    <div class="form-group">
                        <label for="username" class="${properties.kcLabelClass!}">
                            <#if !realm.loginWithEmailAllowed>
                                ${msg("username")}
                            <#elseif !realm.registrationEmailAsUsername>
                                ${msg("usernameOrEmail")}
                            <#else>
                                ${msg("email")}
                            </#if>
                        </label>

                        <input type="text"
                               id="username"
                               name="username"
                               class="${properties.kcInputClass!}"
                               autofocus
                               value="${(auth.attemptedUsername!'')}"
                               aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                               placeholder="<#if !realm.loginWithEmailAllowed>Digite seu usuário<#elseif !realm.registrationEmailAsUsername>Digite seu usuário ou e-mail<#else>Digite seu e-mail</#if>" />

                        <#if messagesPerField.existsError('username')>
                            <span id="input-error-username" class="error-message" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('username'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div id="kc-form-buttons">
                        <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                               type="submit"
                               value="${msg("doSubmit")}"/>
                    </div>
                </form>
            </div>
        </div>
    <#elseif section = "info" >
        <div id="kc-registration">
            <span><a href="${url.loginUrl}">${msg("backToLogin")}</a></span>
        </div>
    </#if>
</@layout.registrationLayout>
