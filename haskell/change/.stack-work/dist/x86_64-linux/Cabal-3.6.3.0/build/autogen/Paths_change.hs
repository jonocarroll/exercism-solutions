{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_change (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
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
version = Version [1,3,0,7] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/media/jono/ExtraDrive1/Projects/exercism-solutions/haskell/change/.stack-work/install/x86_64-linux/baa423fc303fa2badf86ca9327e80c1f28fbdfc2b567dcf654e467b6d4b31ffa/9.2.7/bin"
libdir     = "/media/jono/ExtraDrive1/Projects/exercism-solutions/haskell/change/.stack-work/install/x86_64-linux/baa423fc303fa2badf86ca9327e80c1f28fbdfc2b567dcf654e467b6d4b31ffa/9.2.7/lib/x86_64-linux-ghc-9.2.7/change-1.3.0.7-F2kDcIyfLWx7WGMkgZPt8L"
dynlibdir  = "/media/jono/ExtraDrive1/Projects/exercism-solutions/haskell/change/.stack-work/install/x86_64-linux/baa423fc303fa2badf86ca9327e80c1f28fbdfc2b567dcf654e467b6d4b31ffa/9.2.7/lib/x86_64-linux-ghc-9.2.7"
datadir    = "/media/jono/ExtraDrive1/Projects/exercism-solutions/haskell/change/.stack-work/install/x86_64-linux/baa423fc303fa2badf86ca9327e80c1f28fbdfc2b567dcf654e467b6d4b31ffa/9.2.7/share/x86_64-linux-ghc-9.2.7/change-1.3.0.7"
libexecdir = "/media/jono/ExtraDrive1/Projects/exercism-solutions/haskell/change/.stack-work/install/x86_64-linux/baa423fc303fa2badf86ca9327e80c1f28fbdfc2b567dcf654e467b6d4b31ffa/9.2.7/libexec/x86_64-linux-ghc-9.2.7/change-1.3.0.7"
sysconfdir = "/media/jono/ExtraDrive1/Projects/exercism-solutions/haskell/change/.stack-work/install/x86_64-linux/baa423fc303fa2badf86ca9327e80c1f28fbdfc2b567dcf654e467b6d4b31ffa/9.2.7/etc"

getBinDir     = catchIO (getEnv "change_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "change_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "change_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "change_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "change_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "change_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
