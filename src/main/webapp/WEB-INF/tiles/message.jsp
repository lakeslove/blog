<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
var messageError={
		"error.email.format" : "<fmt:message key='error.email.format'/>",
		"error.email.has.existed" : "<fmt:message key='error.email.has.existed'/>",
		"error.passwrod.is.null" : "<fmt:message key='error.passwrod.is.null'/>",
		"error.input.flag.error" : "<fmt:message key='error.input.flag.error'/>"
};

var messageGeneric={
		"email.verification.code.has.send" : "<fmt:message key='email.verification.code.has.send'/>"
};

var messageValidate={
		
		
};
</script>