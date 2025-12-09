<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
    <#if section = "header">
        ${msg("updatePasswordTitle")}
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <p class="instruction">
                    Por favor, defina uma nova senha para sua conta.
                </p>

                <form id="kc-passwd-update-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                    <input type="text" id="username" name="username" value="${username}" autocomplete="username"
                           readonly="readonly" style="display:none;"/>
                    <input type="password" id="password" name="password" autocomplete="current-password" style="display:none;"/>

                    <div class="form-group">
                        <label for="password-new" class="${properties.kcLabelClass!}">
                            ${msg("passwordNew")} <span class="required">*</span>
                        </label>
                        <input type="password"
                               id="password-new"
                               name="password-new"
                               class="${properties.kcInputClass!}"
                               autofocus
                               autocomplete="new-password"
                               aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                               placeholder="Digite sua nova senha" />

                        <#if messagesPerField.existsError('password')>
                            <span id="input-error-password" class="error-message" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div class="form-group">
                        <label for="password-confirm" class="${properties.kcLabelClass!}">
                            ${msg("passwordNewConfirm")} <span class="required">*</span>
                        </label>
                        <input type="password"
                               id="password-confirm"
                               name="password-confirm"
                               class="${properties.kcInputClass!}"
                               autocomplete="new-password"
                               aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                               placeholder="Confirme sua nova senha" />

                        <#if messagesPerField.existsError('password-confirm')>
                            <span id="input-error-password-confirm" class="error-message" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div id="kc-form-buttons">
                        <#if isAppInitiatedAction??>
                            <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}"
                                   type="submit"
                                   value="${msg("doSubmit")}" />
                            <button class="btn btn-link"
                                    type="submit"
                                    name="cancel-aia"
                                    value="true"
                                    formnovalidate>${msg("doCancel")}</button>
                        <#else>
                            <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                                   type="submit"
                                   value="${msg("doSubmit")}" />
                        </#if>
                    </div>
                </form>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
