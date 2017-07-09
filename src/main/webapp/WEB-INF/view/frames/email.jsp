<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
注意，测试前请修改邮件的授权码！！！（system.property里面的mail.password）
<form:form modelAttribute="email" action="sendEmail.htm" method="post">
<table>
<tr><td>接收邮箱:</td><td><form:input path="toEmailAddresses"/></td></tr>
<tr><td>邮件标题:</td><td><form:input path="subject"/></td></tr>
<tr><td>邮件内容:</td><td><form:textarea path="content"/></td></tr>
<tr><td colspan="2">如果是网易或qq邮箱，那么发出的邮箱必须和开通授权码的邮箱相同</td></tr>
<tr><td>发出邮箱:</td><td><form:input path="fromEmailAddress"/></td></tr>
<tr><td>发送者:</td><td><form:input path="fromPersonName"/></td></tr>
<tr><td colspan="2"><input type="submit" value ="发送"/></td></tr>
</table>
</form:form>
发送结果：
<textarea>
${result}
</textarea>