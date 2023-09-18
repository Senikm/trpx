##  TERSE/PROLIX (TRPX) C++ Fast and Lossless Diffraction (cryo-EM) Data Compressor

___


TRPX is an *efficient compression and decompression* algorithm for *diffraction data*.

TRPX allows efficient and fast compression of integral diffraction data and other integral grey scale
data *(cryo-EM)* into a Terse object that can be decoded by the member function Terse<T>::prolix(iterator). The
prolix(iterator) member function decompresses the data starting at the location defined by 'iterator'
(which can also be a pointer). A Terse object is constructed by supplying it with uncompressed data or a
stream that contains TRPX data.

## How to compile and run it

___

    git clone git@github.com:Senikm/trpx.git 
> Navigate to the project directory
```cmake

    mkdir build
    cd build
    cmake ..
    make 
```


### Running compression and decompression

___

> Compression and decompression
``` c++

    ./terse *                   // all tiff files in this directory are compressed to trpx files 
    
    ./prolix *                  // all trpx files are expanded to tiff files

    ./terse ˜/dir/frame*.tiff  // compresses all tiff files in the directory ~/dir that start with frame\n"

    ./prolix ˜/dir/frame*.trpx   // expands all trpx files in the directory ~/dir that start with frame\n"

    ./terse -help              // All available options will be printed
```


## Fiji/ImageJ plugin for .trpx format files

____

> For compilation, use the java version that came with Fiji, to ensure java compatibility. Also make sure the ij-1.??.jar package is included in the compilation:
> For example, compile with:


    Applications/Fiji.app/java/macosx/zulu8.60.0.21-ca-fx-jdk8.0.322-macosx_x64/jre/Contents/Home/bin/javac -cp /Applications/Fiji.app/jars/ij-1.53t.jar TRPX_Reader.java

> Then create the .jar files with:

    Applications/Fiji.app/java/macosx/zulu8.60.0.21-ca-fx-jdk8.0.322-macosx_x64/jre/Contents/Home/bin/jar -cvf Terse_Reader.jar TRPX_Reader*.class

> Then copy Terse_Reader.jar to the "plugins" directory of Fiji:

    cp TRPX_Reader.jar /Applications/Fiji.app/plugins/.

> Then restart Fiji, and Terse Reader is in the plugins menu.


## Citation
____

**If you use our software in your research, please cite our paper using the following BibTeX entry**:

``` bibtex
@article {Matinyan 2023.05.10.540139,
	author = {Senik Matinyan and Jan Pieter Abrahams},
	title = {TERSE: Efficient compression of the diffraction data},
	elocation-id = {2023.05.10.540139},
	year = {2023},
	doi = {10.1101/2023.05.10.540139},
	publisher = {Cold Spring Harbor Laboratory},
	abstract = {High-throughput data collection in crystallography poses significant challenges in handling massive amounts of data. Here, we present TERSE, a novel lossless compression algorithm specifically designed for diffraction data. We compare TERSE with the established lossless compression algorithms implemented in gzip, CBF, and HDF5, in terms of compression efficiency and speed, using continuous rotation electron diffraction data of an inorganic compound. Our results show that TERSE outperforms these algorithms by achieving a higher data compression at a speed that is at least an order of magnitude faster. TERSE files are byte-order independent and the algorithm can be readily implemented in hardware. By providing a tailored solution for diffraction data, TERSE facilitates more efficient data analysis and interpretation while mitigating storage and transmission concerns. TERSE C++20 compression/decompression code and an ImageJ/Fiji java plugin for reading TERSE files are open-sourced on GitHub under the permissive MIT license.Competing Interest StatementThe authors have declared no competing interest.},
	URL = {https://www.biorxiv.org/content/early/2023/05/12/2023.05.10.540139},
	eprint = {https://www.biorxiv.org/content/early/2023/05/12/2023.05.10.540139.full.pdf},
	journal = {bioRxiv}
}
 

``` 
## Test dataset:

___

https://drive.google.com/drive/folders/16UVHtia6GAK9WFO3RtO32tImhSlgdxEd?usp=sharing
