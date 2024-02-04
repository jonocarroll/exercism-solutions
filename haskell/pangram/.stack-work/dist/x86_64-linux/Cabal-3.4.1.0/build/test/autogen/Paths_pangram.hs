{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_pangram (
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
version = Version [2,0,0,12] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/media/jono/ExtraDrive1/Projects/exercism-solutions/haskell/pangram/.stack-work/install/x86_64-linux/628287ee481fa977c651ea5559d733c795ccff8ddd0980f730491f76a85468c0/9.0.2/bin"
libdir     = "/media/jono/ExtraDrive1/Projects/exercism-solutions/haskell/pangram/.stack-work/install/x86_64-linux/628287ee481fa977c651ea5559d733c795ccff8ddd0980f730491f76a85468c0/9.0.2/lib/x86_64-linux-ghc-9.0.2/pangram-2.0.0.12-76ytu6V2T3m4BdKLWE7Eq5-test"
dynlibdir  = "/media/jono/ExtraDrive1/Projects/exercism-solutions/haskell/pangram/.stack-work/install/x86_64-linux/628287ee481fa977c651ea5559d733c795ccff8ddd0980f730491f76a85468c0/9.0.2/lib/x86_64-linux-ghc-9.0.2"
datadir    = "/media/jono/ExtraDrive1/Projects/exercism-solutions/haskell/pangram/.stack-work/install/x86_64-linux/628287ee481fa977c651ea5559d733c795ccff8ddd0980f730491f76a85468c0/9.0.2/share/x86_64-linux-ghc-9.0.2/pangram-2.0.0.12"
libexecdir = "/media/jono/ExtraDrive1/Projects/exercism-solutions/haskell/pangram/.stack-work/install/x86_64-linux/628287ee481fa977c651ea5559d733c795ccff8ddd0980f730491f76a85468c0/9.0.2/libexec/x86_64-linux-ghc-9.0.2/pangram-2.0.0.12"
sysconfdir = "/media/jono/ExtraDrive1/Projects/exercism-solutions/haskell/pangram/.stack-work/install/x86_64-linux/628287ee481fa977c651ea5559d733c795ccff8ddd0980f730491f76a85468c0/9.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "pangram_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "pangram_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "pangram_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "pangram_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "pangram_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "pangram_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
