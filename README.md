# hybrid-viterbi-decoder
This  project implement a hybrid viterbi decoder, which is able to decode a data syndrome code with both qubit error and syndrome error. Theoretically any code is decodable. To optimize the complexity, the parity check matrix need to be permuted into a "strip" form, with bandheight less than 12, for simulation in hours.

Author: Weilei Zeng  updated: Feb 2019  dated: Summer 2018

### classical binary code
For classical binary code, one use trellis diagram to encode and decode. The decoding method is called viterbi decoding, in which we find a path, starting from zero states and ends in zero states, with maximum probability. It can not only decode the errors, but also decode the codeword at the same time.
### syndrome trellis
If one need to decode the error only and doesn't want to get the information about the codeword, instead of the original trellis diagram, one can contruct a syndrome trellis and apply the same viterbi decoding. In the trellis diagram, the path starts from zero syndrome state, and ends in the state corresponing to the measured syndrome results. 

It is not necessary to do so, which applies an algorithm with the same complexity but gives less information. But for quantum code, one has to do so. Cause for quantum code, the only information we got is the syndrome result for us to correct errors, no information on the encoded message at all. 
### advantage of viterbi decoding
viterbi decoding is indeed a maximum likelihood decoding. One can apply it to any block codes. When aplly it to convolutional code, it has a very lower complexity limited by its constraint length. The trellis diagram also has limited size related to its constraint length. Except than the convolutional code, the parity check matrix of many sparse code can be written in a strip/'convolutional' form. Then viterbi decoding is applicable with low complexity. What we did in this project is that, find the parity check matrix of a data syndrome quantum code, permute it into a strip form and apply modified viterbi decoding.
### degenerate viterbi decoding for quantum code
In classical code, for a given syndrome measurement, it has a distinguished good error and many other bad errors. This leads to a unique path in the trellis diagram. However, in quantum code, for a given syndrome measurement result, there are equivelant good errors differed by a stabilizer generator. In the trellis diagram, this means one need to find different paths. This need to be done for maximum likelihood decoding. But for minimum weight decoding, we only need to find the path of min weight and then check if this is equivalent to the input error by some stabilizer generators.
## project structure
This project include several small projects. (running environment: Matlab R2018a - acedemic use)
  * hybrid viterbi decoder
    * generate_error_prob_vector - give error probability vector for various error model
    * getSavedTrellis            - load trellis from files.
    * getTrellisGF4              - trellis for block code
    * getTrellisGF4Strip         - reduce the P matrix into many one column block codes, and use getTrellisGF4 to get the trellis
    * matrix_generate_strip      - convert standard P into strip form
    * matrix_parameter_strip     - get parameters of P
    * plotresult                 - all plots are generated in this file
    * runViterbiDecoderGF4Strip  - run it manually for test
    * saveTrellis2File           - save all trellis to file to save simulation time
    * simulation678              - simulation for various codes and model
    * simulation7                - simulation for repeated measurement
    * simulationPlot             - simple plot for each simulation
    * upperbound                 - upper bound for classical convolutional code A
    * viterbiDecoderGF4          - viterbi decoder for GF(4) block codes. does work now after several version updates.
    * viterbiDecoderGF4Strip     - hybrid viterbi decoder, hard decision
    * viterbiDecoderGF4StripSoft - hybrid viterbi decoder, soft decision
  * weight distribution
    * forney_spect_binary        - WEF of binary code in Forney's paper
    * forney_spect_gf4           - WEF of GF(4) code in Forney's paper
    * convcell                   - tool function: convolutional product A^k
    * codeword_generate          - exhaust search of codeword with given weight
    * spect_terminated           - WEF of terminated codes.
  * classical viterbi decoder
    * myconvenc                  - practice on viterbi decoder for classical binary code
    * poly2trellis4gf4           - GF(4) version of matlab function poly2trellis()
  * independent function
    * errorAnalysis              - test version of distance
    * distance                   - exhaust search of lower bound on distance of P code
    * minWeightDecoding
  * tiny tool functions
    * dec2octal
    * gf42octal
    * pick10                     - pick a specific digit
    * pickGF4
    * plusGF4
    * plusGF4vec
    * symplecticGF4
    * timesGF4
    * traceGF4
  * others
     * count_lines  
  
  ## structure of the project in Feb 2019 
  * updated/added files compared with the summer version
   * saveTrellis2File             
   * matrix_generate_strip
   * viterbiDecoderGF4DegenerateStripSoftCircuit
   * viterbiDecoderGF4DegenerateStripSoft
   * simulationCircuit
   * simulationRepeatCircuit       
  
 
