//
//  raw_codec.cpp
//  Compress and decompress raw, big-endian, unsigned integer samples using terse/prolix.
//
//  Created by Miguel Hernández-Cabronero <miguel.hernandez@uab.cat> on 2024/11/08

#include <iostream>
#include <vector>
#include "Command_line.hpp"
#include "Terse.hpp"

/**
 * Compress a file that contains unsigned integer samples of type T in big-endian order.
 * 
 * @tparam T sample data type. It determines the number of bytes read per sample from the input file.
 *   Must be one of uint8_t, uint16_t, uint32_t.
 * @param input_path path to a readable file containing the original data
 * @param output_path path to the output file where compressed data are to be stored
 */
template <typename T>
void compress_big_endian_file(std::string input_path, std::string output_path) {
    static_assert(std::is_same<T, uint8_t>::value
                  || std::is_same<T, uint16_t>::value
                  || std::is_same<T, uint32_t>::value,
                  "Only uint8_t, uint16_t and uint32_t are supported as data types");
    constexpr size_t bytes_per_sample = sizeof(T);

    // Original samples read from the input file
    std::vector<T> original_data;

    // Read input data
    {
        std::ifstream ifs(input_path, std::ios::binary);
        std::ifstream::char_type buf[bytes_per_sample];
        while (ifs.read(buf, bytes_per_sample)) {
            T value = 0;
            for (size_t i = 0; i < bytes_per_sample; i++) {
                value += reinterpret_cast<uint8_t*>(buf)[i] << (bytes_per_sample - i - 1) * 8;
            }
            original_data.emplace_back(value);
        }
        ifs.close();
    }

    // Compress data and write bitstream
    {
        jpa::Terse terse(original_data);
        std::ofstream ofs(output_path, std::ios::binary);
        terse.write(ofs);
        ofs.close();
    }
}

/**
 * Decompress a file produced by `compres_big_endian_file<T>` and write the reconstructed
 * samples into a file at `reconstructed_path`. 
 * 
 * @tparam T data sample type. Must be one of uint8_t, uint16_t, uint32_t.
 * @param compressed_path path to the compressed data
 * @param reconstructed_path path where the reconstructed data are to be stored
 */
template <typename T>
void decompress_big_endian_file(std::string compressed_path, std::string reconstructed_path) {
    static_assert(std::is_same<T, uint8_t>::value
                  || std::is_same<T, uint16_t>::value
                  || std::is_same<T, uint32_t>::value,
                  "Only uint8_t, uint16_t and uint32_t are supported as data types");
    constexpr size_t bytes_per_sample = sizeof(T);

    std::vector<T> reconstructed_data;

    // Decompress data
    {
        std::ifstream ifs(compressed_path, std::ios::binary);
        jpa::Terse terse(ifs);
        reconstructed_data.resize(terse.size());
        terse.prolix(reconstructed_data.begin());
    }

    // Output data in big-endian order
    {
        std::ofstream ofs(reconstructed_path, std::ios::binary);
        for (uint16_t sample : reconstructed_data) {
            uint8_t sample_bytes[bytes_per_sample];
            for (int i = 0; i < bytes_per_sample; ++i) {
                sample_bytes[i] = sample & 0xff;
                sample >>= 8;
            }
            assert(sample == 0);
            for (int i = bytes_per_sample - 1; i >= 0; --i) {
                ofs.put(sample_bytes[i]);
            }
        }
    }
}

void show_usage() {
    std::cout << "Usage: raw_codec <mode> <bytes_per_sample> <input_path> <output_path>" << std::endl;
    std::cout << "\tmode: 'compress' or 'decompress'" << std::endl;
    std::cout << "\tbytes_per_sample: number of bytes per sample (only 1, 2 are currently supported)." << std::endl;
    std::cout << "\tinput_path: path to input file with the original (mode='compress') "
        " or compressed (mode='decompress') data." << std::endl;
    std::cout << "\toutput_path: path to the output file where the compressed (mode='compress') "
        " or reconstructed (mode='decompress') data is written." << std::endl;
}

int main(int argc, char* argv[]) {
    if (argc != 5) {
        std::cout << "Invalid number of arguments (found " << argc << ", expected 5)" << std::endl;
        show_usage();
        return 1;
    }

    std::string mode(argv[1]);
    int bytes_per_sample = atoi(argv[2]);
    std::string input_path(argv[3]);
    std::string output_path(argv[4]);

    if (bytes_per_sample != 1 && bytes_per_sample != 2) {
        std::cout << "Invalid number of bytes per sample (" << argv[1] << ", " << bytes_per_sample << ") " << std::endl;
        show_usage();
    }

    if (mode == "compress") {
        switch (bytes_per_sample) {
        case 1:
            compress_big_endian_file<uint8_t>(input_path, output_path);
            break;
        case 2:
            compress_big_endian_file<uint16_t>(input_path, output_path);
            break;
        default:
            abort();
        }
    }
    else if (mode == "decompress") {
        switch (bytes_per_sample) {
        case 1:
            decompress_big_endian_file<uint8_t>(input_path, output_path);
            break;
        case 2:
            decompress_big_endian_file<uint16_t>(input_path, output_path);
            break;
        default:
            abort();
        }
    }
    else {
        std::cout << "Invalid mode " << mode << std::endl;
        show_usage();
        return 1;
    }

    return 0;
}
