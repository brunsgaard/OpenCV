using System;
using OpenCvSharp;

namespace Example
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            new Mat(100, 100, MatType.CV_8UC1, new Scalar(0));
        }
    }
}

