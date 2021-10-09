package main.common;

import java.io.IOException;
import java.util.List;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class Json {
	private static final ObjectMapper mapper = new ObjectMapper();

	public static <T> T parse(String payload, Class<T> cls) {
		try {
			JsonNode node = mapper.readTree(payload.getBytes());
			return mapper.convertValue(node, cls);
		} catch (Exception exp) {
			throw new IllegalArgumentException(exp);
		}
	}

	public static <T> T convert(Object value, Class<T> cls) {
		return mapper.convertValue(value, cls);
	}

	public static String stringify(Object value) {
		try {
			return mapper.writeValueAsString(value);
		} catch (Exception exp) {
			throw new IllegalArgumentException(exp);
		}
	}

	public static <T> T convert(String payload, TypeReference<T> ref) {
		try {
			return mapper.readValue(payload.getBytes(), ref);
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
	}
}
