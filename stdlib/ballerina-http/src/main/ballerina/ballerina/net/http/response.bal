package ballerina.net.http;

import ballerina.mime;
import ballerina.file;

@Description {value:"Returns the header value with the specified header name. If there are more than one header value for the specified header name, the first value is returned."}
@Param {value:"res: The inbound response struct"}
@Param {value:"headerName: The header name"}
@Return {value:"The first header value struct for the provided header name. Returns null if the header does not exist."}
documentation {
Returns the header value with the specified header name. If there are more than one header value for the specified header name, the first value is returned.
- #res The inbound response struct
- #headerName The header name
- #headerVal The first header value struct for the provided header name. Returns null if the header does not exist.
}
public function <InResponse res> getHeader (string headerName) (string headerVal) {
    mime:Entity entity = res.getEntityWithoutBody();
    return getFirstHeaderFromEntity(entity, headerName);
}

@Description {value:"Returns the header value with the specified header name. If there are more than one header value for the specified header name, the first value is returned."}
@Param {value:"res: The outbound response struct"}
@Param {value:"headerName: The header name"}
@Return {value:"The first header value struct for the provided header name. Returns null if the header does not exist."}
documentation {
Returns the header value with the specified header name. If there are more than one header value for the specified header name, the first value is returned.
- #res The outbound response struct
- #headerName The header name
- #headerVal The first header value struct for the provided header name. Returns null if the header does not exist.
}
public function <OutResponse res> getHeader (string headerName) (string headerVal) {
    mime:Entity entity = res.getEntityWithoutBody();
    return getFirstHeaderFromEntity(entity, headerName);
}

@Description {value:"Adds the specified key/value pair as an HTTP header to the outbound response"}
@Param {value:"res: The outbound response message"}
@Param {value:"headerName: The header name"}
@Param {value:"headerValue: The header value"}
documentation {
Adds the specified key/value pair as an HTTP header to the outbound response.
- #res The outbound response message
- #headerName The header name
- #headerValue The header value
}
public function <OutResponse res> addHeader (string headerName, string headerValue) {
    mime:Entity entity = res.getEntityWithoutBody();
    addHeaderToEntity(entity, headerName, headerValue);
}

@Description {value:"Gets the HTTP headers from the inbound response"}
@Param {value:"res: The inbound response message"}
@Param {value:"headerName: The header name"}
@Return {value:"The header values struct array for a given header name"}
documentation {
Gets the HTTP headers from the inbound response.
- #res The inbound response message
- #headerName The header name
- #headerVals The header values struct array for a given header name
}
public function <InResponse res> getHeaders (string headerName) (string[] headerVals) {
    mime:Entity entity = res.getEntityWithoutBody();
    return getHeadersFromEntity(entity, headerName);
}

@Description {value:"Gets the HTTP headers from the outbound response"}
@Param {value:"res: The outbound response message"}
@Param {value:"headerName: The header name"}
@Return {value:"The header values struct array for a given header name"}
documentation {
Gets the HTTP headers from the outbound response.
- #res The outbound response message
- #headerName The header name
- #headerVals The header values struct array for a given header name
}
public function <OutResponse res> getHeaders (string headerName) (string[] headerVals) {
    mime:Entity entity = res.getEntityWithoutBody();
    return getHeadersFromEntity(entity, headerName);
}

@Description {value:"Sets the value of a transport header"}
@Param {value:"res: The outbound response message"}
@Param {value:"headerName: The header name"}
@Param {value:"headerValue: The header value"}
documentation {
Sets the value of a transport header.
- #res The outbound response message
- #headerName The header name
- #headerValue The header value
}
public function <OutResponse res> setHeader (string headerName, string headerValue) {
    mime:Entity entity = res.getEntityWithoutBody();
    setHeaderToEntity(entity, headerName, headerValue);
}

@Description {value:"Removes a transport header from the response"}
@Param {value:"res: The response message"}
@Param {value:"key: The header name"}
documentation {
Removes a transport header from the response.
- #res The response message
- #key The header name
}
public function <OutResponse res> removeHeader (string key) {
    mime:Entity entity = res.getEntityWithoutBody();
    entity.headers.remove(key);
}

@Description {value:"Removes all transport headers from the response"}
@Param {value:"res: The outbound response message"}
documentation {
Removes all transport headers from the response.
- #res The outbound response message
}
public function <OutResponse res> removeAllHeaders () {
    mime:Entity entity = res.getEntityWithoutBody();
    entity.headers = {};
}

@Description {value:"Gets the Content-Length header value from the inbound response"}
@Param {value:"response: The inbound response message"}
@Return {value:"length of the message"}
documentation {
Gets the Content-Length header value from the inbound response.
- #response The inbound response message
- #len length of the message
}
public function <InResponse response> getContentLength () (int len) {
    if (response.getHeader(CONTENT_LENGTH) != null) {
        string strContentLength = response.getHeader(CONTENT_LENGTH);
        return getContentLengthIntValue(strContentLength);
    }
    return -1;
}

@Description {value:"Gets the Content-Length header value from the outbound response"}
@Param {value:"response: The outbound response message"}
@Return {value:"length of the message"}
documentation {
Gets the Content-Length header value from the outbound response.
- #response The outbound response message
- #len length of the message
}
public function <OutResponse response> getContentLength () (int len) {
    if (response.getHeader(CONTENT_LENGTH) != null) {
        string strContentLength = response.getHeader(CONTENT_LENGTH);
        return getContentLengthIntValue(strContentLength);
    }
    return -1;
}

@Description {value:"Gets the inbound response payload in JSON format"}
@Param {value:"response: The inbound response message"}
@Return {value:"The JSON reresentation of the message payload"}
documentation {
Gets the inbound response payload in JSON format.
- #response The inbound response message
- #payLoad The JSON reresentation of the message payload
}
public function <InResponse response> getJsonPayload () (json payLoad) {
    mime:Entity entity = response.getEntity();
    return mime:getJson(entity);
}

@Description {value:"Gets the outbound response payload in JSON format"}
@Param {value:"response: The outbound response message"}
@Return {value:"The JSON reresentation of the message payload"}
documentation {
Gets the outbound response payload in JSON format.
- #response The outbound response message
- #payLoad The JSON reresentation of the message payload
}
public function <OutResponse response> getJsonPayload () (json payLoad) {
    mime:Entity entity = response.getEntity();
    return mime:getJson(entity);
}

@Description {value:"Gets the inbound response payload in XML format"}
@Param {value:"response: The inbound response message"}
@Return {value:"The XML representation of the message payload"}
documentation {
Gets the inbound response payload in XML format.
- #response The inbound response message
- #payLoad The XML reresentation of the message payload
}
public function <InResponse response> getXmlPayload () (xml payLoad) {
    mime:Entity entity = response.getEntity();
    return mime:getXml(entity);
}

@Description {value:"Gets the outbound response payload in XML format"}
@Param {value:"response: The outbound response message"}
@Return {value:"The XML representation of the message payload"}
documentation {
Gets the outbound response payload in XML format.
- #response The outbound response message
- #payLoad The XML reresentation of the message payload
}
public function <OutResponse response> getXmlPayload () (xml payLoad) {
    mime:Entity entity = response.getEntity();
    return mime:getXml(entity);
}

@Description {value:"Gets the inbound response payload as a string"}
@Param {value:"response: The inbound response message"}
@Return {value:"The string representation of the message payload"}
documentation {
Gets the inbound response payload as a string.
- #response The inbound response message
- #payLoad The string reresentation of the message payload
}
public function <InResponse response> getStringPayload () (string payLoad) {
    mime:Entity entity = response.getEntity();
    return mime:getText(entity);
}

@Description {value:"Gets the outbound response payload as a string"}
@Param {value:"response: The outbound response message"}
@Return {value:"The string representation of the message payload"}
documentation {
Gets the outbound response payload as a string.
- #response The outbound response message
- #payLoad The string reresentation of the message payload
}
public function <OutResponse response> getStringPayload () (string payLoad) {
    mime:Entity entity = response.getEntity();
    return mime:getText(entity);
}

@Description {value:"Gets the inbound response payload in blob format"}
@Param {value:"response: The inbound response message"}
@Return {value:"The blob representation of the message payload"}
documentation {
Gets the inbound response payload in blob format.
- #response The inbound response message
- #payLoad The blob reresentation of the message payload
}
public function <InResponse response> getBinaryPayload () (blob payLoad) {
    mime:Entity entity = response.getEntity();
    return mime:getBlob(entity);
}

@Description {value:"Gets the outbound response payload in blob format"}
@Param {value:"response: The outbound response message"}
@Return {value:"The blob representation of the message payload"}
documentation {
Gets the outbound response payload in blob format.
- #response The outbound response message
- #payLoad The blob reresentation of the message payload
}
public function <OutResponse response> getBinaryPayload () (blob payLoad) {
    mime:Entity entity = response.getEntity();
    return mime:getBlob(entity);
}

@Description {value:"Sets a JSON as the outbound response payload"}
@Param {value:"response: The outbound response message"}
@Param {value:"payload: The JSON payload object"}
documentation {
Sets a JSON as the outbound response payload.
- #response The outbound response message
- #payload The JSON payload object
}
public function <OutResponse response> setJsonPayload (json payload) {
    mime:Entity entity = response.getEntityWithoutBody();
    entity.jsonData = payload;
    mime:MediaType mediaType = mime:getMediaType(mime:APPLICATION_JSON);
    entity.contentType = mediaType;
    response.setEntity(entity);
}

@Description {value:"Sets an XML as the outbound response payload"}
@Param {value:"response: The outbound response message"}
@Param {value:"payload: The XML payload object"}
documentation {
Sets an XML as the outbound response payload.
- #response The outbound response message
- #payload The XML payload object
}
public function <OutResponse response> setXmlPayload (xml payload) {
    mime:Entity entity = response.getEntityWithoutBody();
    entity.xmlData = payload;
    mime:MediaType mediaType = mime:getMediaType(mime:APPLICATION_XML);
    entity.contentType = mediaType;
    response.setEntity(entity);
}

@Description { value:"Sets a string as the outbound response payload"}
@Param { value:"response: The outbound response message" }
@Param { value:"payload: The payload to be set to the response as a string" }
documentation {
Sets a string as the outbound response payload.
- #response The outbound response message
- #payload The payload to be set to the response as a string
}
public function <OutResponse response> setStringPayload (string payload) {
    mime:Entity entity = response.getEntityWithoutBody();
    entity.textData = payload;
    mime:MediaType mediaType = mime:getMediaType(mime:TEXT_PLAIN);
    entity.contentType = mediaType;
    response.setEntity(entity);
}

@Description {value:"Sets a blob as the outbound response payload"}
@Param {value:"response: The outbound response message"}
@Param {value:"payload: The blob representation of the message payload"}
documentation {
Sets a blob as the outbound response payload.
- #response The outbound response message
- #payload The blob representation of the message payload
}
public function <OutResponse response> setBinaryPayload (blob payload) {
    mime:Entity entity = response.getEntityWithoutBody();
    entity.byteData = payload;
    mime:MediaType mediaType = mime:getMediaType(mime:APPLICATION_OCTET_STREAM);
    entity.contentType = mediaType;
    response.setEntity(entity);
}

@Description {value:"Sets the entity body of the outbound response with the given file content"}
@Param {value:"response: The outbound response message"}
@Param {value:"content: File containing the actual content"}
@Param {value:"contentType: Content-Type of the given data"}
documentation {
Sets the entity body of the outbound response with the given file content.
- #response The outbound response message
- #content File containing the actual content
- #contentType Content-Type of the given data
}
public function <OutResponse response> setEntityBody(file:File content, string contentType) {
    mime:MediaType mediaType = mime:getMediaType(contentType);
    mime:Entity entity = response.getEntityWithoutBody();
    entity.contentType = mediaType;
    entity.overflowData = content;
    response.setEntity(entity);
}
