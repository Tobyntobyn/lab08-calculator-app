//
//  Fraction.swift
//  prog2.1
//
//  Created by Tobyn Packer on 7/20/18.
//  Copyright © 2018 Tobyn Packer. All rights reserved.
//
import Foundation

final class Fraction: CustomStringConvertible, StringConvertibleNum{
    
    //Stored propertities
    private let num: Int; //numerator
    private let den: Int; //demon
    
    // COMPUTED PROPERTIES
    
    /**
     Converts fraction to a Float value
     
     - returns: Float Decimal value of the fraction
     */
    var decimal: Float {
        get {
            // num and den are of type Int, therefore,
            // they need to be explicitly converted to Floats
            return Float(self.num)/Float(self.den);
        }
    }
    /**
     Converts object to a string description
     
     - returns: String String representation of a fraction
     */
    var description: String {
        if(self.den == 1){
            return "\(self.num)"
        }
        
        return "\(self.num)/\(self.den)"
    }
    
    // Initalisers
    convenience init() {
        //init(1, 0)
        //        self.num = 1
        //        self.den = 0
        self.init(num: 1, den: 0 );
    }
    
    init(num: Int, den: Int) {
        // Setting numerator to 0 and
        // denominator to 1 is equivalent
        // to setting the fraction to zero
        assert(den != 0, "Denominator cannot be zero")
        
        var num = num
        var den = den
        
        if(den < 0){
            // If the denominator is negative
            // multiply the numerator and
            // denominator by -1 - this
            // ensures the denominator is
            // always positive, and numerator
            // carries the appropriate sign
            num = -num
            den = -den
        }
        
        //Finds greatest common denom
        for gcd in (1...den).reversed(){
            //common denom found, divide num and den by it
            if(num%gcd == 0 && den%gcd==0){
                num /= gcd
                den /= gcd
                break
            }
        }
        self.num = num
        self.den = den
        
    }
    
    convenience init(num: Int) {
        // Setting numerator to 0 and
        // denominator to 1 is equivalent
        // to setting the fraction to zero
        self.init(num: num, den: 1);
    }
    
    func add(_ f: Fraction) -> Fraction{
        return Fraction(num: self.num*f.den + self.den*f.num,
                        den: self.den*f.den)
    }
    
    func subtract(_ f: Fraction) -> Fraction{
        return Fraction(num: self.num*f.den - self.den*f.num,
                        den: self.den*f.den)
    }
    
    func multiply(_ f: Fraction) -> Fraction{
        return Fraction(num: self.num*f.num, den: self.den*f.den)
    }
    
    func divide(_ f: Fraction) -> Fraction{
        return Fraction(num: self.num*f.den, den: self.den*f.num)
    }
    
    /**
     Add a fraction to fraction.
     
     - parameter f1: Fraction to add to
     - parameter f2: Fraction to be added
     
     - returns: The result of f1 + f2.
     */
    static func add(_ f1: Fraction, to f2: Fraction) -> Fraction{
        return Fraction(num: f1.num*f2.den + f1.den*f2.num,
                        den: f1.den*f2.den)
    }
    
    static func subtract(_ f1: Fraction, from f2: Fraction) -> Fraction{
        return f2.subtract(f1)
    }
    
    static func multiply(_ f1: Fraction, by f2: Fraction) -> Fraction{
        return f1.multiply(f2)
    }
    
    static func divide(_ f1: Fraction, by f2: Fraction) -> Fraction{
        return f1.divide(f2)
    }
    
    /**
     Adds an integer to self.
     
     - parameter x: Integer to add to self
     
     - returns: Fraction The result of adding x to self.
     */
    func add(_ x: Int) -> Fraction{
        return Fraction(num: self.num + self.den*x,
                        den: self.den)
    }
    
    func subtract(_ x: Int) -> Fraction{
        return Fraction(num: self.num - self.den*x,
                        den: self.den)
    }
    
    func multiply(_ x: Int) -> Fraction{
        return Fraction(num: self.num*x, den: self.den)
    }
    
    func divide(_ x: Int) -> Fraction{
        return Fraction(num: self.num, den: self.den*x)
    }
    
    /**
     + operator between two Fractions
     */
    static func +(f1: Fraction, f2: Fraction) -> Fraction{
        return f1.add(f2)
    }
    
    static func -(f1: Fraction, f2: Fraction) -> Fraction{
        return f1.subtract(f2)
    }
    
    static func *(f1: Fraction, f2: Fraction) -> Fraction{
        return f1.multiply(f2)
    }
    
    static func /(f1: Fraction, f2: Fraction) -> Fraction{
        return f1.divide(f2)
    }
    
    /**
     overloading operators with Frations and int
     */
    static func +(f1: Fraction, f2: Int) -> Fraction{
        return f1.add(f2)
    }
    static func -(f1: Fraction, f2: Int) -> Fraction{
        return f1.subtract(f2)
    }
    
    static func *(f1: Fraction, f2: Int) -> Fraction{
        return f1.multiply(f2)
    }
    
    static func /(f1: Fraction, f2: Int) -> Fraction{
        return f1.divide(f2)
    }
    
    /**
     Converts string to a Fraction object.  Supports string
     syntax of the following format:
     "a" - converts it to fraction a/1
     "a/b" - converts it to fraction a/b
     
     - parameter string: String to convert
     - returns: Fraction? Fraction read from string, nil if
     syntax error in the string
     */
    static func readFromString(_ string: String) -> Fraction? {
        // Default values for numerator
        // and denomintor
        var num: Int = 0;
        var den: Int = 1;
        
        // Break the string into tokens separated by / symbol
        var tokens = string.components(separatedBy: "/")
        
        // If there is at least one token, then there is
        // a numerator value
        if tokens.count > 0 {
            // Try to convert numerator string to integer -
            // if not successful, return nil
            if let n = Int(tokens[0]) {
                num = n
            } else {
                return nil
            }
        }
        
        // If there is a second token, then there is
        // a denominator value
        if tokens.count > 1 {
            // Try to convert denominator string to integer -
            // if not successful, return nil
            if let d = Int(tokens[1]) {
                den = d
            } else {
                return nil
            }
        }
        // Return new fraction initialising its
        // numerator and denominator to values
        // read from the string
        return Fraction(num: num, den: den)
    }
}
