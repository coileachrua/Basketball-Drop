function xor_decrypt_from_base64(_b64, _key) {
    var raw_buf = buffer_base64_decode(_b64);
    var size = buffer_get_size(raw_buf);
    var result = "";
    var key_len = string_length(_key);

    for (var i = 0; i < size; i++) {
        var val = buffer_peek(raw_buf, i, buffer_u8);
        var k = ord(string_char_at(_key, (i mod key_len) + 1));
        result += chr(val ^ k); // <- XOR using ^
    }

    buffer_delete(raw_buf);
    return result;
}
