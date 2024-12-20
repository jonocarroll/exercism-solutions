{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_strain (
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
version = Version [0,1,0,3] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/media/jono/ExtraDrive1/Projects/exercism-solutions/haskell/strain/.stack-work/install/x86_64-linux/ca8d53278ed1130ce345a9f9894f8492f59781a3adeff9e7274f6e4513120425/9.6.2/bin"
libdir     = "/media/jono/ExtraDrive1/Projects/exercism-solutions/haskell/strain/.stack-work/install/x86_64-linux/ca8d53278ed1130ce345a9f9894f8492f59781a3adeff9e7274f6e4513120425/9.6.2/lib/x86_64-linux-ghc-9.6.2/strain-0.1.0.3-FjwAAd5hajDCRscwpmRh51"
dynlibdir  = "/media/jono/ExtraDrive1/Projects/exercism-solutions/haskell/strain/.stack-work/install/x86_64-linux/ca8d53278ed1130ce345a9f9894f8492f59781a3adeff9e7274f6e4513120425/9.6.2/lib/x86_64-linux-ghc-9.6.2"
datadir    = "/media/jono/ExtraDrive1/Projects/exercism-solutions/haskell/strain/.stack-work/install/x86_64-linux/ca8d53278ed1130ce345a9f9894f8492f59781a3adeff9e7274f6e4513120425/9.6.2/share/x86_64-linux-ghc-9.6.2/strain-0.1.0.3"
libexecdir = "/media/jono/ExtraDrive1/Projects/exercism-solutions/haskell/strain/.stack-work/install/x86_64-linux/ca8d53278ed1130ce345a9f9894f8492f59781a3adeff9e7274f6e4513120425/9.6.2/libexec/x86_64-linux-ghc-9.6.2/strain-0.1.0.3"
sysconfdir = "/media/jono/ExtraDrive1/Projects/exercism-solutions/haskell/strain/.stack-work/install/x86_64-linux/ca8d53278ed1130ce345a9f9894f8492f59781a3adeff9e7274f6e4513120425/9.6.2/etc"

getBinDir     = catchIO (getEnv "strain_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "strain_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "strain_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "strain_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "strain_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "strain_sysconfdir") (\_ -> return sysconfdir)



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
