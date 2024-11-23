#include <stdio.h>
#include "skinny_aead.h"

int main() {
    uint8_t associated_data[] = {0x01, 0x02, 0x03, 0x04};
    size_t associated_data_len = sizeof(associated_data);

    uint8_t message[] = {0x00, 0x10, 0x20, 0x30,
                         0x40, 0x50, 0x60, 0x70,
                         0x80, 0x90, 0xA0, 0xB0,
                         0xC0, 0xD0, 0xE0, 0xF0};
    size_t message_len = sizeof(message);

    uint8_t key[16] = {0x00, 0x01, 0x02, 0x03,
                       0x04, 0x05, 0x06, 0x07,
                       0x08, 0x09, 0x0A, 0x0B,
                       0x0C, 0x0D, 0x0E, 0x0F};

    uint8_t nonce[12] = {0xAA, 0xBB, 0xCC, 0xDD,
                         0xEE, 0xFF, 0x00, 0x11,
                         0x22, 0x33, 0x44, 0x55};

    uint8_t ciphertext[256]; // Allocate enough space for ciphertext
    size_t ciphertext_len;

    // Call the encryption function
    skinny_aead_encrypt(associated_data, associated_data_len,
                        message, message_len,
                        key, nonce,
                        ciphertext, &ciphertext_len);


//    skinny_aead_encrypt();
    return 0;
}
