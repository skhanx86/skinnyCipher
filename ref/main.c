#include <stdio.h>
#include "skinny_aead.h"
#include "skinny_reference.h"
//int main() {
//    uint8_t associated_data[] = {0x01, 0x02, 0x03, 0x04};
//    size_t associated_data_len = sizeof(associated_data);
//
//
//    uint8_t message[] = {0x00, 0x10, 0x20, 0x30,
//                         0x40, 0x50, 0x60, 0x70,
//                         0x80, 0x90, 0xA0, 0xB0,
//                         0xC0, 0xD0, 0xE0, 0xF0};
//    size_t message_len = sizeof(message);
//
//    uint8_t key[16] = {0x00, 0x01, 0x02, 0x03,
//                       0x04, 0x05, 0x06, 0x07,
//                       0x08, 0x09, 0x0A, 0x0B,
//                       0x0C, 0x0D, 0x0E, 0x0F};
//
//    uint8_t nonce[12] = {0xAA, 0xBB, 0xCC, 0xDD,
//                         0xEE, 0xFF, 0x00, 0x11,
//                         0x22, 0x33, 0x44, 0x55};
//
//    uint8_t ciphertext[256]; // Allocate enough space for ciphertext
//    size_t ciphertext_len;
//
//    // Call the encryption function
//    skinny_aead_encrypt(associated_data, associated_data_len,
//                        message, message_len,
//                        key, nonce,
//                        ciphertext, &ciphertext_len);
//
//
////    skinny_aead_encrypt();
//    return 0;
//}

int main() {

    ////    reg_plaintext           = 128'ha3994b66ad85a3459f44e92b08f550cb;
    ////    initial_tweakey         = 383'hdf889548cfc7ea52d296339301797449ab588a34a47f1ab2dfe9c8293fbea9a5ab1afac2611012cd8cef952618c3ebe8;

    uint8_t input[16] = {0xA3, 0x99, 0x4B, 0x66, 0xAD, 0x85, 0xA3, 0x45,
                         0x9F, 0x44, 0xE9, 0x2B, 0x08, 0xF5, 0x50,0xCB};

    uint8_t tweakey[48] = {0xDF, 0x88, 0x95, 0x48, 0xCF, 0xC7, 0xEA, 0x52,
                           0xD2, 0x96, 0x33, 0x93, 0x01, 0x79, 0x74, 0x49,
                           0xAB, 0x58, 0x8A, 0x34, 0xA4, 0x7F, 0x1A, 0xB2,
                           0xDF, 0xE9, 0xC8, 0x29, 0x3F, 0xBE, 0xA9, 0xA5,
                           0xAB, 0x1A, 0xFA, 0xC2, 0x61, 0x10, 0x12, 0xCD,
                           0x8C, 0xEF, 0x95, 0x26, 0x18, 0xC3, 0xEB, 0xE8};
    uint8_t output[16] = {0};

    enc(input, tweakey, output, 5);

    printf("Input: ");
    for (int i = 0; i < 16; i++) {
        printf("%02X ", input[i]);
    }
    printf("\nTweakey: ");
    for (int i = 0; i < 48; i++) {
        printf("%02X ", tweakey[i]);
    }
    printf("\nOutput: ");
    for (int i = 0; i < 16; i++) {
        printf("%02X ", output[i]);
    }
    printf("\n");

    return 0;
}
