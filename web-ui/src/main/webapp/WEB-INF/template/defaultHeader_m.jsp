﻿<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="social_and_flags">
	<div id="logos">
		<a href="https://twitter.com/podcastpedia" target="_blank" class="icon-twitter"></a>
		<a href="https://www.facebook.com/Podcastpedia" target="_blank" class="icon-facebook"></a>
		<a href="https://google.com/+PodcastpediaOrg" target="_blank" class="icon-google-plus"></a>
		<a href="https://www.podcastpedia.org/feeds/most_popular.rss" target="_blank" class="icon-feed3"></a>
	</div>
	<div id="flags">
		<ul class="pureCssMenu pureCssMenum">
			<li class="pureCssMenui"><a class="pureCssMenui" href="#"><span><spring:message code="your.language"/></span><![if gt IE 6]></a><![endif]><!--[if lte IE 6]><table><tr><td><![endif]-->
			<ul class="pureCssMenum">
				<li class="pureCssMenui"><a class="pureCssMenui" href="?lang=ro">Română</a></li>
				<li class="pureCssMenui"><a class="pureCssMenui" href="?lang=de">Deutsch</a></li>
				<li class="pureCssMenui"><a class="pureCssMenui" href="?lang=en">English</a></li>
				<li class="pureCssMenui"><a class="pureCssMenui" href="?lang=es">Español</a></li>
				<li class="pureCssMenui"><a class="pureCssMenui" href="?lang=fr">Français</a></li>
				<li class="pureCssMenui"><a class="pureCssMenui" href="?lang=pl">Polski</a></li>
			</ul>
			<!--[if lte IE 6]></td></tr></table></a><![endif]--></li>
		</ul>
	</div>
</div>

<!-- display login button if not authenticated-->
<sec:authorize access="isAnonymous()">
  <div id="login-button">

    <spring:eval expression="@appProperties['keycloak.server']" var="keycloakServer"/>
    <c:url value="${keycloakServer}/auth/realms/demo/protocol/openid-connect/auth" var="signIn_URL">
      <c:param name="client_id" value="podcastpedia" />
      <c:param name="response_type" value="code" />
      <c:param name="redirect_uri" value="http://localhost:8181/users/subscriptions" />
    </c:url>
    <a href="<c:url value='/sso/login'/>"><spring:message code="user.login"/></a>
  </div>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
  <div id="login-button">
    <a href="<c:url value='/sso/logout'/>"><spring:message code="user.logout"/></a>
  </div>
</sec:authorize>
<div class="clear"></div>
<%@ include file="header_common_part_m.jsp" %>






