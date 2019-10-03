{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_LambdaNat (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/jlloyd/programming-languages-2019/Assignment1/.stack-work/install/x86_64-osx/d807ff2be6b0bd6109a1726e6d708872e9502575dcce230403756cd22d87cb53/8.6.4/bin"
libdir     = "/Users/jlloyd/programming-languages-2019/Assignment1/.stack-work/install/x86_64-osx/d807ff2be6b0bd6109a1726e6d708872e9502575dcce230403756cd22d87cb53/8.6.4/lib/x86_64-osx-ghc-8.6.4/LambdaNat-0.1.0.0-2JAl3kww18IIbaJjXyBlHq-LambdaNat-exe"
dynlibdir  = "/Users/jlloyd/programming-languages-2019/Assignment1/.stack-work/install/x86_64-osx/d807ff2be6b0bd6109a1726e6d708872e9502575dcce230403756cd22d87cb53/8.6.4/lib/x86_64-osx-ghc-8.6.4"
datadir    = "/Users/jlloyd/programming-languages-2019/Assignment1/.stack-work/install/x86_64-osx/d807ff2be6b0bd6109a1726e6d708872e9502575dcce230403756cd22d87cb53/8.6.4/share/x86_64-osx-ghc-8.6.4/LambdaNat-0.1.0.0"
libexecdir = "/Users/jlloyd/programming-languages-2019/Assignment1/.stack-work/install/x86_64-osx/d807ff2be6b0bd6109a1726e6d708872e9502575dcce230403756cd22d87cb53/8.6.4/libexec/x86_64-osx-ghc-8.6.4/LambdaNat-0.1.0.0"
sysconfdir = "/Users/jlloyd/programming-languages-2019/Assignment1/.stack-work/install/x86_64-osx/d807ff2be6b0bd6109a1726e6d708872e9502575dcce230403756cd22d87cb53/8.6.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "LambdaNat_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "LambdaNat_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "LambdaNat_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "LambdaNat_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "LambdaNat_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "LambdaNat_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
