function xor_encrypt_to_base64(_text, _key) {
    var key_len = string_length(_key);
    var text_len = string_length(_text);

    var buffer = buffer_create(text_len, buffer_grow, 1);

    for (var i = 0; i < text_len; i++) {
        var t = ord(string_char_at(_text, i + 1));
        var k = ord(string_char_at(_key, (i mod key_len) + 1));
        buffer_write(buffer, buffer_u8, t ^ k); // <- XOR using ^
    }

    var encoded = buffer_base64_encode(buffer, 0, text_len);
    buffer_delete(buffer);
    return encoded;
}
