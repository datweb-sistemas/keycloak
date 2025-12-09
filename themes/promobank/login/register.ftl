<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
    <#if section = "header">
        Criar Nova Conta
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">

                    <div class="form-group">
                        <label for="firstName" class="${properties.kcLabelClass!}">
                            ${msg("firstName")} <span class="required">*</span>
                        </label>
                        <input type="text"
                               id="firstName"
                               class="${properties.kcInputClass!}"
                               name="firstName"
                               value="${(register.formData.firstName!'')}"
                               aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                               placeholder="Seu primeiro nome" />
                        <#if messagesPerField.existsError('firstName')>
                            <span id="input-error-firstname" class="error-message" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div class="form-group">
                        <label for="lastName" class="${properties.kcLabelClass!}">
                            ${msg("lastName")} <span class="required">*</span>
                        </label>
                        <input type="text"
                               id="lastName"
                               class="${properties.kcInputClass!}"
                               name="lastName"
                               value="${(register.formData.lastName!'')}"
                               aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                               placeholder="Seu sobrenome" />
                        <#if messagesPerField.existsError('lastName')>
                            <span id="input-error-lastname" class="error-message" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div class="form-group">
                        <label for="email" class="${properties.kcLabelClass!}">
                            ${msg("email")} <span class="required">*</span>
                        </label>
                        <input type="text"
                               id="email"
                               class="${properties.kcInputClass!}"
                               name="email"
                               value="${(register.formData.email!'')}"
                               autocomplete="email"
                               aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                               placeholder="seu.email@exemplo.com" />
                        <#if messagesPerField.existsError('email')>
                            <span id="input-error-email" class="error-message" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('email'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <#if !realm.registrationEmailAsUsername>
                        <div class="form-group">
                            <label for="username" class="${properties.kcLabelClass!}">
                                ${msg("username")} <span class="required">*</span>
                            </label>
                            <input type="text"
                                   id="username"
                                   class="${properties.kcInputClass!}"
                                   name="username"
                                   value="${(register.formData.username!'')}"
                                   autocomplete="username"
                                   aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                                   placeholder="Escolha um nome de usuário" />
                            <#if messagesPerField.existsError('username')>
                                <span id="input-error-username" class="error-message" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('username'))?no_esc}
                                </span>
                            </#if>
                        </div>
                    </#if>

                    <#if passwordRequired??>
                        <div class="form-group">
                            <label for="password" class="${properties.kcLabelClass!}">
                                ${msg("password")} <span class="required">*</span>
                            </label>
                            <input type="password"
                                   id="password"
                                   class="${properties.kcInputClass!}"
                                   name="password"
                                   autocomplete="new-password"
                                   aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                                   placeholder="Crie uma senha segura" />
                            <#if messagesPerField.existsError('password')>
                                <span id="input-error-password" class="error-message" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('password'))?no_esc}
                                </span>
                            </#if>
                        </div>

                        <div class="form-group">
                            <label for="password-confirm" class="${properties.kcLabelClass!}">
                                ${msg("passwordConfirm")} <span class="required">*</span>
                            </label>
                            <input type="password"
                                   id="password-confirm"
                                   class="${properties.kcInputClass!}"
                                   name="password-confirm"
                                   autocomplete="new-password"
                                   aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                                   placeholder="Digite a senha novamente" />
                            <#if messagesPerField.existsError('password-confirm')>
                                <span id="input-error-password-confirm" class="error-message" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                                </span>
                            </#if>
                        </div>
                    </#if>

                    <#if recaptchaRequired??>
                        <div class="form-group">
                            <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                        </div>
                    </#if>

                    <div id="kc-form-buttons">
                        <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                               type="submit"
                               value="${msg("doRegister")}"/>
                    </div>
                </form>
            </div>
        </div>
    <#elseif section = "info" >
        <div id="kc-registration">
            <span>${msg("alreadyHaveAccount")} <a href="${url.loginUrl}">${msg("doLogIn")}</a></span>
        </div>
    </#if>
</@layout.registrationLayout>
