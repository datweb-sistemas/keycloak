<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>

    <title>${msg("loginTitle",(realm.displayName!''))}</title>

    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />

    <#if properties.stylesCommon?has_content>
        <#list properties.stylesCommon?split(' ') as style>
            <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>

<body>
    <div class="container">
        <!-- Right Panel - Blue Background -->
        <div class="right-panel">
            <div class="right-content">
                <!-- Logo -->
                <div class="logo-container">
                    <div class="logo-icon">P</div>
                    <div class="logo-text">PromoBank</div>
                </div>

                <!-- Heading -->
                <div class="heading">
                    A maior solução para promotoras de crédito consignado
                </div>

                <!-- News Section -->
                <div class="news-section">
                    <div class="news-header">
                        <svg class="bell-icon" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M15 6.66667C15 5.34058 14.4732 4.06881 13.5355 3.13113C12.5979 2.19345 11.3261 1.66667 10 1.66667C8.67392 1.66667 7.40215 2.19345 6.46447 3.13113C5.52678 4.06881 5 5.34058 5 6.66667C5 12.5 2.5 14.1667 2.5 14.1667H17.5C17.5 14.1667 15 12.5 15 6.66667Z" stroke="currentColor" stroke-width="1.66667" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M11.4417 17.5C11.2952 17.7526 11.0849 17.9622 10.8319 18.1079C10.5789 18.2537 10.292 18.3304 10 18.3304C9.70802 18.3304 9.42111 18.2537 9.16808 18.1079C8.91506 17.9622 8.70478 17.7526 8.55835 17.5" stroke="currentColor" stroke-width="1.66667" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                        <span class="news-title">Últimas Novidades</span>
                    </div>

                    <div class="news-card">
                        <div class="news-image" style="display: flex; align-items: center; justify-content: center; background: linear-gradient(135deg, #4F7FD6 0%, #1976D2 100%);">
                            <img src="${url.resourcesPath}/img/corporate-login.svg" alt="Login Corporativo" style="width: 80px; height: 80px; opacity: 0.9;">
                            <div class="news-image-overlay"></div>
                            <div class="news-tags">
                                <span class="tag tag-info">INFO</span>
                                <span class="tag tag-date">Hoje</span>
                            </div>
                        </div>
                        <div class="news-content">
                            <h3>Acesso Corporativo PromoBank</h3>
                            <p>Faça login com suas credenciais corporativas para acessar a plataforma completa de gestão de crédito consignado.</p>
                        </div>
                    </div>
                </div>

                <!-- Carousel Dots -->
                <div class="carousel-dots" id="carousel-dots">
                    <div class="dot active"></div>
                </div>
            </div>
        </div>

        <!-- Login Form -->
        <div class="login-form-container">
            <div class="login-header">
                <div class="login-subtitle">LOGIN EMPRESARIAL</div>
                <div class="login-title"><#nested "header"></div>
                <#if !(auth?has_content && auth.showUsername() && !auth.showResetCredentials())>
                    <div class="login-description">Entre com suas credenciais para continuar</div>
                <#else>
                    <div id="kc-username">
                        <label id="kc-attempted-username">${auth.attemptedUsername}</label>
                        <a id="reset-login" href="${url.loginRestartFlowUrl}">
                            <span class="kc-tooltip-text">${msg("restartLoginTooltip")}</span>
                        </a>
                    </div>
                </#if>
            </div>

            <!-- Mensagens de Alerta -->
            <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                <div class="alert alert-${message.type}" role="alert">
                    <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
                </div>
            </#if>

            <!-- Formulário Principal -->
            <#nested "form">

            <!-- Outras opções de autenticação -->
            <#if auth?has_content && auth.showTryAnotherWayLink() && showAnotherWayIfPresent>
                <form id="kc-select-try-another-way-form" action="${url.loginAction}" method="post">
                    <div class="form-group">
                        <input type="hidden" name="tryAnotherWay" value="on"/>
                        <a href="#" id="try-another-way"
                           onclick="document.forms['kc-select-try-another-way-form'].submit();return false;">${msg("doTryAnotherWay")}</a>
                    </div>
                </form>
            </#if>

            <!-- Informações Adicionais -->
            <#if displayInfo>
                <div id="kc-info">
                    <div id="kc-info-wrapper">
                        <#nested "info">
                    </div>
                </div>
            </#if>
        </div>
    </div>

    <#if properties.feedEnabled?? && properties.feedEnabled == "true">
    <script>
    (function() {
        const feedUrl = '${properties.feedUrl!"https://www.promobank.com.br/feed/"}';
        const newsContainer = document.querySelector('.news-card');
        const dotsContainer = document.getElementById('carousel-dots');

        if (!newsContainer) return;

        function parseDate(dateStr) {
            const date = new Date(dateStr);
            const day = String(date.getDate()).padStart(2, '0');
            const months = ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'];
            const month = months[date.getMonth()];
            const year = date.getFullYear();
            return day + ' ' + month + ' ' + year;
        }

        function extractImage(content) {
            const imgRegex = /<img[^>]+src="([^">]+)"/;
            const match = imgRegex.exec(content);
            if (match && match[1]) return match[1];

            // SVG de fallback com ícone corporativo
            return 'data:image/svg+xml,' + encodeURIComponent(
                '<svg viewBox="0 0 400 200" xmlns="http://www.w3.org/2000/svg">' +
                '<defs><linearGradient id="bg" x1="0%" y1="0%" x2="100%" y2="100%">' +
                '<stop offset="0%" style="stop-color:#4F7FD6"/>' +
                '<stop offset="100%" style="stop-color:#1976D2"/>' +
                '</linearGradient></defs>' +
                '<rect width="400" height="200" fill="url(#bg)"/>' +
                '<g transform="translate(200,100)">' +
                '<circle cx="0" cy="0" r="35" fill="white" opacity="0.2"/>' +
                '<path d="M-15,-10 L-15,10 L15,10 L15,-10 Z M-10,-15 L-10,-10 L10,-10 L10,-15 Z" fill="white" opacity="0.9"/>' +
                '<circle cx="0" cy="-5" r="8" fill="white" opacity="0.9"/>' +
                '<path d="M-8,3 Q-8,10 0,12 Q8,10 8,3 Z" fill="white" opacity="0.9"/>' +
                '</g></svg>'
            );
        }

        function createNewsCard(item) {
            const title = item.querySelector('title')?.textContent || '';
            const descContent = item.querySelector('description')?.textContent || '';
            const description = descContent.replace(/<[^>]*>/g, '').substring(0, 100) + '...';
            const pubDate = item.querySelector('pubDate')?.textContent || '';
            const link = item.querySelector('link')?.textContent || '#';
            const imageUrl = extractImage(descContent);

            return '<div class="news-card" onclick="window.open(\'' + link + '\', \'_blank\')" style="cursor: pointer;">' +
                '<div class="news-image">' +
                '<img src="' + imageUrl + '" alt="' + title + '">' +
                '<div class="news-image-overlay"></div>' +
                '<div class="news-tags">' +
                '<span class="tag tag-info">NOVO</span>' +
                '<span class="tag tag-date">' + parseDate(pubDate) + '</span>' +
                '</div>' +
                '</div>' +
                '<div class="news-content">' +
                '<h3>' + title + '</h3>' +
                '<p>' + description + '</p>' +
                '</div>' +
                '</div>';
        }

        const proxies = [
            'https://corsproxy.io/?' + encodeURIComponent(feedUrl),
            'https://api.codetabs.com/v1/proxy?quest=' + encodeURIComponent(feedUrl)
        ];

        let proxyIndex = 0;

        function tryFetch() {
            if (proxyIndex >= proxies.length) return;

            fetch(proxies[proxyIndex], { headers: { 'Accept': 'application/rss+xml' } })
                .then(response => response.ok ? response.text() : Promise.reject())
                .then(xmlText => {
                    const parser = new DOMParser();
                    const xml = parser.parseFromString(xmlText, 'text/xml');
                    const items = xml.querySelectorAll('item');
                    if (items.length > 0) {
                        newsContainer.outerHTML = createNewsCard(items[0]);
                    }
                })
                .catch(() => {
                    proxyIndex++;
                    if (proxyIndex < proxies.length) setTimeout(tryFetch, 500);
                });
        }

        tryFetch();
    })();
    </script>
    </#if>

</body>
</html>
</#macro>
